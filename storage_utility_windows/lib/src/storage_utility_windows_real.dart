import 'dart:ffi';
import 'dart:math';

import 'package:ffi/ffi.dart';
import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';
import 'package:win32/win32.dart';

/// The Windows implementation of [StorageUtilityPlatform].
class StorageUtilityWindows extends StorageUtilityPlatform {
  /// Registers this class as the default instance of [StorageUtilityPlatform].
  static void registerWith() {
    StorageUtilityPlatform.instance = StorageUtilityWindows();
  }

  @override
  Future<int> getFreeBytes({required String path}) async {
    final pathNamePtr = path.toNativeUtf16();
    final lpFreeBytesAvailableToCaller = calloc<ULONGLONG>();
    final lpTotalNumberOfFreeBytes = calloc<ULONGLONG>();

    try {
      final int hr = GetDiskFreeSpaceEx(pathNamePtr,
          lpFreeBytesAvailableToCaller, nullptr, lpTotalNumberOfFreeBytes);

      if (FAILED(hr)) {
        throw Exception('Unable to get free bytes of storage space');
      }

      return min(
          lpFreeBytesAvailableToCaller.value, lpTotalNumberOfFreeBytes.value);
    } finally {
      free(pathNamePtr);
      free(lpFreeBytesAvailableToCaller);
      free(lpTotalNumberOfFreeBytes);
    }
  }

  @override
  Future<int> getTotalBytes({required String path}) async {
    final pathNamePtr = path.toNativeUtf16();
    final lpTotalNumberOfBytes = calloc<ULONGLONG>();

    try {
      final int hr = GetDiskFreeSpaceEx(
          pathNamePtr, nullptr, lpTotalNumberOfBytes, nullptr);

      if (FAILED(hr)) {
        throw Exception('Unable to get total bytes of storage space');
      }

      return lpTotalNumberOfBytes.value;
    } finally {
      free(pathNamePtr);
      free(lpTotalNumberOfBytes);
    }
  }
}
