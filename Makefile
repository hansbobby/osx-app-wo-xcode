CC=clang
APP_NAME=makebuilt
CFLAGS=-framework Foundation

all: main clean_app package_app

clean_app:
	rm -rf "./build/$(APP_NAME).app/"
package_app:
	mkdir -p "./build/$(APP_NAME).app"/Contents/{MacOS,Resources}
#	cp -R "$(FRAMEWORK_PATH)/Some.framework" "./build/$(APP_NAME).app/Contents/Resources/"
	cp Info.plist "./build/$(APP_NAME).app/Contents/"
	sed -e "s/APP_NAME/$(APP_NAME)/g" -i "" "./build/$(APP_NAME).app/Contents/Info.plist"
	mv ./main "./build/$(APP_NAME).app/Contents/MacOS/$(APP_NAME)"
