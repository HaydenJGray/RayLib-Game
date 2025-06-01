# My C + Raylib Learning Project/Game

## Description
A project to learn C using manual compilation and libraries. Using Raylib to make a game!

## How to Build
```bash
clang src/main.c -Iinclude $(pkg-config --cflags --libs raylib) -o build/main
```

## Notes
- Raylib will give outputs in terminal
- in tasks.json: "externalConsole"; Set to true to launch with an external terminal, false for regular behavior

## License
This project is licensed under the [MIT License](LICENSE).