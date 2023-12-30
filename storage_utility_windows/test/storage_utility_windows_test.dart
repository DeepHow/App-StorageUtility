import 'package:flutter_test/flutter_test.dart';
import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';
import 'package:storage_utility_windows/storage_utility_windows.dart';

void main() {
  test('registered instance', () {
    StorageUtilityWindows.registerWith();
    expect(StorageUtilityPlatform.instance, isA<StorageUtilityWindows>());
  });

  test('getFreeBytes', () async {
    final StorageUtilityWindows platform = StorageUtilityWindows();
    expect(await platform.getFreeBytes(path: 'C:\\'), isPositive);
  });

  test('getTotalBytes', () async {
    final StorageUtilityWindows platform = StorageUtilityWindows();
    expect(await platform.getTotalBytes(path: 'C:\\'), isPositive);
  });
}
