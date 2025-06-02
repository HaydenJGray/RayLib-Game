# Makefile
#
# Commands:
# 	make						- runs 'make all'
# 	make all					- builds and runs for current OS
#	make windows				- builds and runs for windows
#	make mac					- builds and runs for mac
#	make build					- builds current OS version
# 	make build-windows			- builds windows version
# 	make build-mac				- builds mac version
# 	make run					- runs current OS build
#	make run-windows			- runs windows build
# 	make run-mac				- runs mac build
# 	make clean 					- removes current OS build
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

build:
	mkdir -p build
	$(CC) $(SRC) -o $(TARGET) $(CFLAGS) $(LDFLAGS)
build-windows: 
	mkdir -p build
	gcc $(SRC) -o build/$(NAME).exe -Wall -Wextra -Iinclude -lraylib -lmingw32 -lopengl32 -lgdi32 -lwinmm
build-mac:
	mkdir -p build
	clang $(SRC) -o build/$(NAME) -Wall -Wextra -Iinclude $(shell pkg-config --cflags $(PKG)) $(shell pkg-config --libs $(PKG))

run:
	./$(TARGET)
run-windows:
	./build/$(NAME).exe
run-mac:
	./build/$(NAME)

clean:
	rm -f $(TARGET)
clean-windows:
	rm -f build/$(NAME).exe
clean-mac:
	rm -f build/$(NAME)
clean-all:
	rm -rf build

# Include
include make/common.mk
include make/release.mk