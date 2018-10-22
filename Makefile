validate:
	pod spec lint DeepLinkRouter.podspec --swift-version=4.2

upload:
	pod trunk push DeepLinkRouter.podspec --allow-warnings
