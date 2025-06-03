# Release MakeFile
#
# Commands:
#	make dist					- builds and compiles dependencies into dist folder for current os
#	make dist-windows			- builds and compiles dependencies into dist folder for Windows
#	make dist-mac				- builds and compiles dependencies into dist folder for mac
#	make release				- runs 'make dist', compreses dist, and places it into release
#	make release-windows 		- runs 'make dist-windows', compreses dist, and places it into release
#	make release-mac			- runs 'make dist-mac', compreses dist, and places it into release
#	make clean-release			- removes dist folder
#	make update-version			- updates version number across the system for current os
#	make update-version-windows	- updates version number across the system for windows 
#	make update-version-mac		- updates version number across the system for mac

# Include
include make/common.mk

# Always execute commands
.PHONY: dist dist-windows dist-mac release release-windows release-mac clean-release update-version update-version-windows update-version-mac update-readme-windows update-readme-mac update-launch-mac

dist: dist-$(OS)
dist-windows: build-windows
	rm -rf dist
	mkdir -p dist
	cp build/$(NAME).exe dist/
	cp /mingw64/bin/libraylib.dll dist/
	cp /mingw64/bin/glfw3.dll dist/
	cp /mingw64/bin/libwinpthread-1.dll dist/
dist-mac: build-mac
	rm -rf dist
	mkdir -p $(DIST_DIR)
	cp build/$(NAME) $(DIST_DIR)/

release: release-$(OS)
release-windows: dist-windows
	mkdir -p $(RELEASE_DIR)
	cd dist && zip -r ../$(RELEASE_DIR)/$(NAME)-windows.zip .
release-mac: dist-mac
	@echo $(VERSION)

	# Create .app bundle structure
	rm -rf $(DIST_DIR)/$(NAME).app
	mkdir -p $(DIST_DIR)/$(NAME).app/Contents/MacOS

	# Copy binary
	cp $(BUILD_DIR)/$(NAME) $(DIST_DIR)/$(NAME).app/Contents/MacOS/Raylib-Game
	chmod +x $(DIST_DIR)/$(NAME).app/Contents/MacOS/Raylib-Game

	# Generate Info.plist from template
	sed "s/{{VERSION}}/$(VERSION)/g" make/Info.plist.template > $(DIST_DIR)/$(NAME).app/Contents/Info.plist

	# Create release folder and zip
	mkdir -p $(RELEASE_DIR)
	cd $(DIST_DIR) && zip -r ../$(RELEASE_DIR)/$(NAME)-mac-app.zip $(NAME).app


clean-release:
	rm -rf $(RELEASE_DIR)
	
update-version: update-version-$(OS)
update-version-windows: update-readme-windows
	@echo $(VERSION)
update-version-mac: update-readme-mac update-launch-mac
	@echo $(VERSION)

update-readme-windows: 
	sed -i "/<!-- VERSION LINE -->/!b;n;c\\**Version:** $(VERSION)" README.md
update-readme-mac:
	sed -i '' -e '/<!-- VERSION LINE -->/ {n; s/.*/**Version:** $(VERSION)/;}' README.md

update-launch-mac:
	sed -i '' "/\"program\"/s|build/.*\"|build/$(NAME)\"|" .vscode/launch.json