# ===== Common Variables =====

# Pull version from version file
VERSION := $(shell cat version.txt)
NAME := Raylib-Game-$(VERSION)

# Directory Structure
BUILD_DIR := build
DIST_DIR := dist
RELEASE_DIR := release
SRC_DIR := dir
INCLUDE_DIR := include

# Detect OS
ifeq ($(OS),Windows_NT)
	TARGET = build/$(NAME).exe
	CC = gcc
	CFLAGS = -Wall -Wextra -Iinclude
	LDFLAGS = -lraylib -lmingw32 -lopengl32 -lgdi32 -lwinmm
else
	TARGET = build/$(NAME)
	CC = clang
	PKG = raylib
	CFLAGS = -Wall -Wextra -Iinclude $(shell pkg-config --cflags $(PKG))
	LDFLAGS = $(shell pkg-config --libs $(PKG))
endif