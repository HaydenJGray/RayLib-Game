#include <stdio.h>
#include "raylib.h"
#include "game.h"

const int screenWidth = 800;
const int screenHeight = 600;

void InitGame(void)
{   
    // Use Raylib to initialize the window, input screen width, height, and name for title bar.
    InitWindow(screenWidth, screenHeight, "Hayden");
    printf("Game Initialized\n");
}

void RunGameLoop(void)
{
    // Main game loop, handles drawing.
    while (!WindowShouldClose())
    {
        BeginDrawing();
        ClearBackground(BLACK);
        DrawText("Hello, Raylib!", 300, 280, 20, RAYWHITE);
        EndDrawing();
    }
}

void CloseGame(void)
{
    printf("Closing Game...\n");
    CloseWindow();
}