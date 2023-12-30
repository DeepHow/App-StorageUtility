# storage_utility_platform_interface

A common platform interface for the [`storage_utility`][1] plugin.

This interface allows platform-specific implementations of the `storage_utility`
plugin, as well as the plugin itself, to ensure they are supporting the
same interface.

# Usage

To implement a new platform-specific implementation of `storage_utility`, extend
[`StorageUtilityPlatform`][2] with an implementation that performs the
platform-specific behavior, and when you register your plugin, set the default
`StorageUtilityPlatform` by calling
`StorageUtilityPlatform.instance = MyPlatformStorageUtility()`.

[1]: https://pub.dev/packages/storage_utility
[2]: lib/storage_utility_platform_interface.dart
