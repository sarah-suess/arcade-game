#include "gba.h"
#include "mode4.h"
#include "print.h"
#include "start04.h"
#include "sound.h"
#include <stdio.h>
#include "game.h"

unsigned short oldButtons;
unsigned short buttons;

// prototypes
void initialize();

// random prototype
void srand();

// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToScore();
void score();
void goToLose();
void lose();

// State enum
enum STATE {START, PAUSE, GAME, SCORE, LOSE} state;

// score variables
int playerScore;
char playerBuffer[41];

// lives variables
int playerLives;
char livesBuffer[41];

// random seed
int rSeed;

// used to keep the highest score
int highScore;
char highScoreBuffer[41];

int main() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    mgba_open();
	mgba_printf("Debugging Initialized");

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State Machine
        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case SCORE:
                score();
                break;
            case LOSE:
                lose();
                break;
        }        
    }
}

void initialize() {
    
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    // used to store highest score
    highScore = 0;

    goToStart();
}

// uses an array of chars and an array of colors to spell out press start and set up starting screen
void goToStart() {
    DMANow(3, &start04Pal, PALETTE, (1 << 31 | (start04PalLen / 2)));
    drawFullscreenImage4(start04Bitmap);

    char letters[11] = {'P', 'R', 'E', 'S', 'S', ' ', 'S', 'T','A','R','T'};
    unsigned short colors[11] = {0x0a1, 0x0a1, 0x0a1, 0x0a1, 0x0a1, RED, 0x0a1, 0x0a1, 0x0a1, 0x0a1, 0x0a1};
    int col = 55;
    int spacing = 12;
    for(int i = 0; i < 11; i++){
         drawChar4(col + (i * spacing), 70, letters[i], colors[i]);
    }
    waitForVBlank();
    flipPage();

    state = START;

    rSeed = 0;
}

// runs every frame of the start state
void start() {
    rSeed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed); 
        goToGame();
        initGame();
    }
}

// takes you to game state
void goToGame() {
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();

    drawString4(184, 3, "score: ", 0x017);
    sprintf(playerBuffer, "%d", playerScore);
    drawString4(224, 4, playerBuffer, 0x017);   

    drawString4(1, 3, "lives: ", 0x008);
    sprintf(livesBuffer, "%d", playerLives);
    drawString4(40, 4, livesBuffer, 0x008);   

    waitForVBlank();
    flipPage();

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // if the player has no lives, the game ends
    if (playerLives <= 0) {
        if (playerScore > highScore) {
            highScore = playerScore;
        }
        goToLose();
    }
}

// Sets up the pause state
void goToPause() {
    fillScreen4(0x007);
    drawString4(84, 40, "game paused!", BLACKID);
    drawString4(45, 80, "Press 'start' to resume.", BLACKID);
    drawString4(35, 100, "Press 'A' to see scoreboard.", BLACKID);
    drawString4(42, 122, "Press 'select' to restart.", BLACKID);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToScore();
    }
}

// Sets up the lose state
void goToLose() {
    fillScreen4(0x016);
    drawString4(90, 65, "game over", 0x007);
    drawString4(70, 76, "final score:", 0x007);
    sprintf(playerBuffer, "%d", playerScore);
    drawString4(145, 77, playerBuffer, 0x007);

    drawString4(33, 100, "Press 'A' to see scoreboard.", 0x007); 
    drawString4(35, 111, "Press 'start' to play again", 0x007); 

    waitForVBlank();
    flipPage();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToScore();
    }
}

// Sets up the score state
void goToScore() {
    fillScreen4(0x009);
    drawString4(76, 76, "high score:", 0x007);
    sprintf(highScoreBuffer, "%d", highScore);
    drawString4(145, 77, highScoreBuffer, 0x007);

    drawString4(35, 100, "Press 'start' to play again", 0x007); 

    waitForVBlank();
    flipPage();

    state = SCORE;
}

// Runs every frame of the ScoreBoard State
void score() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}