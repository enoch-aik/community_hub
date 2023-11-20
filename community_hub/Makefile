.PHONY: clean refresh build-runner build_adb build-apk clean-ios clean-build-runner shorebird-patch-android shorebird-patch-ios build-appbundle shorebird-build-apk

shorebird-release-android:
	@echo "Building Shorebird App for Android"
	shorebird release android

shorebird-release-ios:
	@echo "Release Shorebird App for iOS"
	shorebird release ios-alpha

shorebird-patch-android:
	@echo "Building Shorebird App for Android"
	shorebird patch android

shorebird-patch-ios:
	@echo "Building Shorebird App for iOS"
	shorebird patch ios-alpha

refresh:
	@echo " Getting Dependency"
	flutter pub get
clean-ios:
	@echo " Cleaning ios the code"
	flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	flutter pub get
	cd ios && pod install
build-appbundle: refresh
	@echo "Building appbundle"
	flutter build appbundle
build-aab:
	@echo "Getting Dependency"
	flutter pub get
	flutter build appbundle
build-apk: refresh
	@echo "Building apk"
	flutter build apk --split-per-abi --obfuscate --split-debug-info=build/app/outputs/symbols

shorebird-build-apk: refresh
	@echo "Building apk"
	shorebird build apk
build-runner:
	@echo "Build Runner Started"
	flutter pub run build_runner build
clean-build-runner:
	@echo " Cleaning Build Runner"
	flutter pub run build_runner build —delete-conflicting-outputs
clean:
	@echo "F Cleaning Flutter"
	flutter clean
	flutter pub get