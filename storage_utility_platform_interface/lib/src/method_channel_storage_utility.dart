import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../storage_utility_platform_interface.dart';

/// An implementation of [StorageUtilityPlatform] that uses method channels.
class MethodChannelStorageUtility extends StorageUtilityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('plugins.deephow.com/storage_utility');

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
