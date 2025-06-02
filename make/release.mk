# Release MakeFile
#
# Commands:
#	make dist					- builds and compiles dependencies into dist folder for current OS
#	make dist-windows			- builds and compiles dependencies into dist folder for Windows
#	make dist-mac				- builds and compiles dependencies into dist folder for mac
#	make release				- runs 'make dist', compreses dist, and places it into release
#	make release-windows 		- runs 'make dist-windows', compreses dist, and places it into release
#	make release-mac			- runs 'make dist-mac', compreses dist, and places it into release
#	make clean-release			- removes dist folder
#	make update-version			- updates version number across the system

# Include
include make/common.mk

# Always execute commands
.PHONY: dist dist-windows dist-mac release release-windows release-mac clean-release update-version

dist-windows: update-version build-windows
	rm -rf dist
	mkdir -p dist
	cp build/$(NAME).exe dist/
	cp /mingw64/bin/libraylib.dll dist/
	cp /mingw64/bin/glfw3.dll dist/
	cp /mingw64/bin/libwinpthread-1.dll dist/

release-windows: dist-windows
	mkdir -p $(RELEASE_DIR)
	cd dist && zip -r ../$(RELEASE_DIR)/$(NAME)-windows.zip .

clean-release:
	rm -rf $(RELEASE_DIR)

update-version:
	@echo $(VERSION)
	sed -i "/<!-- VERSION LINE -->/!b;n;c\\**Version:** $(VERSION)" README.md
