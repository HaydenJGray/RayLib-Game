#include <stdio.h>
#include "game.h"

int main(void){
    printf("Initializing Game... ");
    #ifdef VERSION
    printf("| Version: %s\n", VERSION);
    #else
    printf("Version not defined.\n");
    #endif

    InitGame();
    RunGameLoop();
    CloseGame();

    return 0;
}