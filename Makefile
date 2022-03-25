validate:
	pod spec lint DeepLinkRouter.podspec --swift-version=5.6

upload:
	pod trunk push DeepLinkRouter.podspec --allow-warnings
