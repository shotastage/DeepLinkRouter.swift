validate:
	pod spec lint DeepLinkRouter.podspec --swift-version=5.9

upload:
	pod trunk push DeepLinkRouter.podspec --allow-warnings
