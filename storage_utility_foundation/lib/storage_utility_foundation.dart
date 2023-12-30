import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';

/// The iOS and macOS implementation of [StorageUtilityPlatform].
class StorageUtilityFoundation extends StorageUtilityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('plugins.deephow.com/storage_utility');

  /// Registers this class as the default instance of [StorageUtilityPlatform].
  static void registerWith() {
    StorageUtilityPlatform.instance = StorageUtilityFoundation();
  }

  @override
  Future<int> getFreeBytes({required String path}) async {
    final int? bytes = await methodChannel.invokeMethod<int>('getFreeBytes', {
      'path': path,
    });
    if (bytes == null) {
      throw Exception('Unable to get free bytes of storage space');
    }
    return bytes;
  }

  @override
  Future<int> getTotalBytes({required String path}) async {
    final int? bytes = await methodChannel.invokeMethod<int>('getTotalBytes', {
      'path': path,
    });
    if (bytes == null) {
      throw Exception('Unable to get total bytes of storage space');
    }
    return bytes;
  }
}
