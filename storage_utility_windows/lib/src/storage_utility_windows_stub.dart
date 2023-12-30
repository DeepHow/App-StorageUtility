import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';

/// A stub implementation to satisfy compilation of multi-platform packages that
/// depend on storage_utility_windows. This should never actually be created.
class StorageUtilityWindows extends StorageUtilityPlatform {
  /// Errors on attempted instantiation of the stub. It exists only to satisfy
  /// compile-time dependencies, and should never actually be created.
  StorageUtilityWindows() : assert(false);

  /// Registers the Windows implementation.
  static void registerWith() {
    StorageUtilityPlatform.instance = StorageUtilityWindows();
  }
}
