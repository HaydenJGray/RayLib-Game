CC = clang
PKG = raylib
CFLAGS = -Wall -Wextra -Iinclude $(shell pkg-config --cflags $(PKG))
LDFLAGS = $(shell pkg-config --libs $(PKG))
SRC = $(wildcard src/*.c)
OUT = build/main


all: $(OUT)

$(OUT): $(SRC)
	mkdir -p build
	$(CC) $(SRC) $(CFLAGS) -o $(OUT) $(LDFLAGS)

run: all
	./$(OUT)

clean:
	rm -rf build