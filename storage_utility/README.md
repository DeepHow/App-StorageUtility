# storage_utility
<?code-excerpt path-base="example/lib"?>

A Flutter plugin for getting storage information on host platform, such as available space and total space.
Supports Android, iOS, macOS and Windows.

|             | Android | iOS   | macOS  | Windows     |
|-------------|---------|-------|--------|-------------|
| **Support** | SDK 24+ | 11.0+ | 10.14+ | Windows 10+ |

## Usage

To use this plugin, add `storage_utility` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

## Example
<?code-excerpt "readme_excerpts.dart (Example)"?>
```dart
final int freeBytes = await getFreeBytes();

final int totalBytes = await getTotalBytes();
```
