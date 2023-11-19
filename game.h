// structs
typedef struct {
    int x;
    int y;
    int height;
    int width;
    int dodge;
    int powerup;
} PLAYER;

typedef struct {
    int x;
    int y;
    int height;
    int width;
    int active;
    int speed;
} ENEMY;

typedef struct {
    int x;
    int y;
    int height;
    int width;
    int speed;
    int active;
} BULLET;

// max number of enemies that can appear
#define ENEMYCOUNT 4

// custom game colors
#define NUMCOLORS 1

// this does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS)};
extern unsigned short colors[NUMCOLORS];

extern PLAYER player;
extern ENEMY enemy;
extern BULLET bullet;

// tracks the score and lives
int playerScore, playerLives;

// used to loop through enemies
int currentEnemies;

// duration of powerup
int timeTrack;

// keeps track of how many enemies are on screen
int enemiesLeft;

// duration of cooldown
int coolDown;

void initGame();
void initPlayer();
void initEnemy();
void drawGame();
void drawPlayer();
void updatePlayer();
void updateGame();
void drawEnemy();
void updateEnemies();
void initBullet();
void drawBullet();
void updateBullet();

