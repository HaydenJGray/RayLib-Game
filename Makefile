# Makefile
#
# Commands:
# 	make						- runs 'make all'
# 	make all					- builds and runs for current os
#	make windows				- builds and runs for windows
#	make mac					- builds and runs for mac
#	make build					- builds current os version
# 	make build-windows			- builds windows version
# 	make build-mac				- builds mac version
# 	make run					- runs current os build
#	make run-windows			- runs windows build
# 	make run-mac				- runs mac build
# 	make clean 					- removes current os build
#	make clean-windows 			- removes windows build
#	make clean-mac				- removes mac build
# 	make clean-all				- removes build folder

# -Wall, -Wextra, and -g are for debugging and should not be in the final release

# Always execute commands
.PHONY: all windows mac build build-windows build-mac run run-windows run-mac clean clean-windows clean-mac clean-all

# Variables
SRC = $(wildcard src/*.c)

# Commands
all: build run
windows: build-windows run-windows
mac: build-mac run-mac

build: update-version
	mkdir -p build
	$(CC) $(SRC) -o $(TARGET) $(CFLAGS) $(LDFLAGS)
build-windows: update-version-windows
	mkdir -p build
	gcc $(SRC) -o build/$(NAME).exe -Wall -Wextra -Iinclude -lraylib -lmingw32 -lopengl32 -lgdi32 -lwinmm
build-mac: update-version-mac
	mkdir -p build
	clang $(SRC) -o build/$(NAME) -Wall -Wextra -Iinclude $(shell pkg-config --cflags $(PKG)) $(shell pkg-config --libs $(PKG))

run:
	./$(TARGET)
run-windows:
	./build/$(NAME).exe
run-mac:
	./build/$(NAME)

clean:
	rm -rf $(TARGET)
clean-windows:
	rm -rf build/$(NAME).exe
clean-mac:
	rm -rf build/$(NAME)
clean-all:
	rm -rf build

# Include
include make/common.mk
include make/release.mk