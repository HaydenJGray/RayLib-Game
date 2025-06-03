#include <stdio.h>
#include <string.h>
#include "raylib.h"
#include "game.h"


const int screenWidth = 800;
const int screenHeight = 600;
char gameTitle[100];

void InitGame(void)
{   
    #ifdef NAME
    snprintf(gameTitle, sizeof(gameTitle), "%s", NAME);
    #else
    //strcpy(gameTitle, "Game"
    #endif
    // Use Raylib to initialize the window, input screen width, height, and name for title bar.
    InitWindow(screenWidth, screenHeight, gameTitle);
    printf("Game Initialized: %s\n", gameTitle);
}

void RunGameLoop(void)
{
    // Main game loop, handles drawing.
    while (!WindowShouldClose())
    {
        BeginDrawing();
        ClearBackground(BLACK);
        DrawText(gameTitle, 300, 280, 20, RAYWHITE);
        EndDrawing();
    }
}

void CloseGame(void)
{
    printf("Closing Game...\n");
    CloseWindow();
}