make splash:
	dart run flutter_native_splash:create --path=custom-splash.yaml

make clean-splash:
	dart run flutter_native_splash:remove
	rm -rf ios/Flutter/App.framework
	rm -rf ios/Flutter/Flutter.framework
	rm -rf ios/Flutter/FlutterPluginRegistrant
	rm -rf ios/Flutter/flutter_export_environment.sh
	rm -rf ios/Flutter/flutter_export_environment.sh
	rm -rf ios/Flutter/flutter_assets
	rm -rf ios/Flutter/flutter_assets.zip
	rm -rf ios/Flutter/AppIcon.appiconset
	rm -rf ios/Runner.xcworkspace/xcuserdata
	rm -rf ios/Runner.xcworkspace/xcuserdata/*.xcuserdatad
	rm -rf ios/Runner.xcworkspace/xcuserdata/*.xcuserdatad/*.xcuserdatad

make pub:
	flutter pub get

make clean-pub:
	flutter clean
	rm -rf pubspec.lock
	flutter pub get

make build-apk:
	flutter build apk --split-per-abi --release

make build-ios:
	flutter build ipa --release --no-codesign


.PHONY: splash clean-splash pub clean-pub build-apk build-ios