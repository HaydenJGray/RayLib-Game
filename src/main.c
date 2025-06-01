#include <stdio.h>
#include "game.h"

int main(void){
    printf("Program Launched\n");

    InitGame();
    RunGameLoop();
    CloseGame();

    return 0;
}