# My C Learning Project

## Description
A project to learn C using manual compilation and libraries.

## How to Build
```bash
clang src/main.c -Iinclude $(pkg-config --cflags --libs raylib) -o build/main
```
    Raylib will give outputs in terminal
    in tasks.json: "externalConsole"; Set to true to launch with an external terminal, false for regular behavior