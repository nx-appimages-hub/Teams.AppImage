SOURCE="https://go.microsoft.com/fwlink/p/?linkid=2112886&culture=en-us&country=ww"
DESTINATION="build.deb"
OUTPUT="Teams.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	
	dpkg -x $(DESTINATION) build
	rm -rf AppDir/application
	
	mkdir --parents AppDir/application
	cp -r build/usr/share/teams/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/application
	rm -rf build
