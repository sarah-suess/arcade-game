#include "gba.h"
#include "game.h"
#include "mode4.h"
#include "print.h"
#include <stdlib.h>
#include <stdio.h>
#include "player01.h"
#include "player04.h"
#include "enemy04.h"
#include "sound.h"
#include "star04.h"
#include "lib.h"

// structs on the screen
ENEMY enemies[ENEMYCOUNT];
PLAYER player;
BULLET bullet;


void initGame() {
    // setting initial values
    playerScore = 0;
    playerLives = 3;
    coolDown = 0;
    bullet.active = 0;

    // initializing structs
    initPlayer();
    initEnemy();

    // initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK};
    DMANow(3, enemy04Pal, PALETTE, 16);
    DMANow(3, player01Pal + 16, PALETTE + 16, 16);
    DMANow(3, player04Pal + 32, PALETTE + 32, 16);
    DMANow(3, star04Pal + 32 + 16, PALETTE + 32 + 16, 16);
    

    // load the custom game color
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// initializes the player
void initPlayer() {
    player.x = 100;
    player.y = 120;
    player.width = 28;
    player.height = 20;
    player.dodge = 0;
    player.powerup = 0;
}

// initializes the bullet
void initBullet() {
    bullet.x = player.x + 13;
    bullet.y = player.y;
    bullet.width = 2;
    bullet.height = 2;
    bullet.active = 1;
}

// initializes the enemies
void initEnemy() {
    int enemyNumber = (rand() % (4 - 2 + 1)) + 2;
    mgba_printf("%d, enemy number", enemyNumber);
    currentEnemies = enemyNumber;

    enemiesLeft = enemyNumber;

    for (int i = 0; i < enemyNumber; i++) {
        enemies[i].y = 5;
        enemies[i].width = 28;
        enemies[i].height = 20;
        enemies[i].active = 1;
        
        switch (enemyNumber) {
            int spacer;
            case 2:
                spacer = (rand() % (92 - 1 + 1)) + 1;
                mgba_printf("%d, spacer 2", spacer);
                enemies[i].x = (spacer + (i * 10)) + (i * 90);
                break;
            case 3:
                spacer = (rand() % (52 - 1 + 1)) + 1;
                mgba_printf("%d, spacer 3", spacer);
                enemies[i].x = (spacer + (i * 20)) + (i * 50);
                break;
            case 4:
                spacer = (rand() % (32 - 1 + 1)) + 1;
                mgba_printf("%d, spacer 4", spacer);
                enemies[i].x = (spacer + (i * 10)) + (i * 40);
                break;
        }
    }
    for (int i = 0; i< enemyNumber; i++) {
        mgba_printf("%d, enemy x", enemies[i].x);
        mgba_printf("%d, enemy y", enemies[i].y);
    }
}

// updates the game
void updateGame() {
    // update structs
    updatePlayer();
    for (int i = 0; i < currentEnemies; i++) {
        updateEnemies(&enemies[i]);
    }
    updateBullet();
    // if no enemies are left, reinitializes them
    if (enemiesLeft <= 0) {
        initEnemy();
    }
}

// updates the player
void updatePlayer() {
    // moves the player
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x > 0)) {
        player.x -= 4;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && (player.x < 212)) {
        player.x += 4;
    }
    if (BUTTON_HELD(BUTTON_UP) && (player.y > 0)) {
        player.y -= 4;
    }
    if (BUTTON_HELD(BUTTON_DOWN) && (player.y < 139)) {
        player.y += 4;
    }

    // the player shoots if button A is pressed
    if (BUTTON_HELD(BUTTON_A)) {
        initBullet();
    }

    // if the player is not dodging/poweredup, if B is pressed it activates it
    if (!player.powerup) {
        if (coolDown > 0) {
            coolDown--;
        }
        if (coolDown <= 0) {
            if (BUTTON_HELD(BUTTON_B)) {
                player.dodge = 1;
                player.powerup = 1;
                timeTrack = 0;
                coolDown = 1;
            }
        }
    }

    // used to track how long the powerup lasts and resets the cooldown when powerup ends
    // also plays a sound using frequency sweep when dodge is activated
    if (player.powerup) {
        timeTrack++;
        if (timeTrack >= 0 && timeTrack <= 10) {
            REG_SND1CNT = DMG_ENV_VOL(8) | DMG_STEP_TIME(3);
            REG_SND1SWEEP = DMG_SWEEP_NUM(5) | DMG_SWEEP_STEPTIME(15) | DMG_SWEEP_DOWN;
            REG_SND1FREQ = NOTE_G3 | SND_RESET | DMG_FREQ_TIMED;
        }
        if (timeTrack > 10 && timeTrack <= 20) {
            REG_SND1CNT = DMG_ENV_VOL(8) | DMG_STEP_TIME(3);
            REG_SND1SWEEP = DMG_SWEEP_NUM(5) | DMG_SWEEP_STEPTIME(15) | DMG_SWEEP_DOWN;
            REG_SND1FREQ = NOTE_G4 | SND_RESET | DMG_FREQ_TIMED;
        }
        if (timeTrack >= 200) {
            player.dodge = 0;
            player.powerup = 0;
            coolDown = 250;
        }
    }
}

// updates the enemies
void updateEnemies(ENEMY* e) {
    if (e->active) {
        // if the enemy is not killed before reaching bottom of screen, player loses a life
        if (e->y >= 139) {
            e->active = 0;
            enemiesLeft--;
            playerLives--;
            mgba_printf("%d, left enemies in update game", enemiesLeft);
        }
        if (!player.dodge) {
            // if the player is not dodging, a collision with an enemy causes the player to lose a life
            if (collision(e->x - 2, e->y - 1, e->width - 2, e->height - 1, player.x, player.y, player.width, player.height)) {
                e->active = 0;
                playerLives--;
                enemiesLeft--;
                mgba_printf("%d, left enemies in update game", enemiesLeft);
            }
        } else {
            // if the player is dodging, a collision will kill the enemy and the score goes up
            if (collision(e->x - 2, e->y - 1, e->width - 2, e->height - 1, player.x, player.y, player.width, player.height)) {
                e->active = 0;
                enemiesLeft--;
                playerScore++;
                mgba_printf("%d, left enemies in update game", enemiesLeft);
            }
        }
        // if a bullet hits an enemy, the enemy dies and the score goes up
        if (collision(e->x - 2, e->y - 1, e->width - 2, e->height - 1, bullet.x, bullet.y, bullet.width, bullet.height)) {
            REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(7);
            REG_SND2FREQ = NOTE_G6 | SND_RESET | DMG_FREQ_TIMED;
            e->active = 0;
            bullet.active = 0;
            playerScore++;
            enemiesLeft--;
            mgba_printf("%d, left enemies in update game", enemiesLeft);
        }
        // moves the enemies down
        e->y++;
    }
}

// draws elements on screen
void drawGame() {
    fillScreen4(BLACKID);
    drawPlayer();
    for (int i = 0; i < currentEnemies; i++) {
        drawEnemy(&enemies[i]);
    }
    drawBullet();
    if (coolDown <= 0) {
        drawImage4(172, 3, 8, 8, star04Bitmap);
    }
    // draws screen borders (i like the look)
    drawRect4(0,0,240,1,0x014);
    drawRect4(0,0,1,160,0x014);
    drawRect4(239,0,1,160,0x014);
    drawRect4(0,159,240,1,0x014);
}

// draws the player
void drawPlayer() {
    if (!player.dodge) {
        drawImage4(player.x, player.y, player.width, player.height, player01Bitmap);
    } else {
        drawImage4(player.x, player.y, player.width, player.height, player04Bitmap);
    }
}

// draws the enemies
void drawEnemy(ENEMY* e) {
    if (e->active) {
        drawImage4(e->x, e->y, e->width, e->height, enemy04Bitmap);
    }
}

// draws the bullet
void drawBullet() {
    if (bullet.active) {
        drawRect4(bullet.x,bullet.y,bullet.width,bullet.height,0x01b);
    }
}

// moves the bullet
void updateBullet() {
    if (bullet.y <= 0) {
        bullet.active = 0;
    }
    if (bullet.active) {
        bullet.y -= 2;
    }
}

