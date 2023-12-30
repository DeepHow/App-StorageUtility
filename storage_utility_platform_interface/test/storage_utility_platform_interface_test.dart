import 'package:flutter_test/flutter_test.dart';
import 'package:storage_utility_platform_interface/src/method_channel_storage_utility.dart';
import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('$StorageUtilityPlatform', () {
    test('$MethodChannelStorageUtility is the default instance', () {
      expect(
          StorageUtilityPlatform.instance, isA<MethodChannelStorageUtility>());
    });

    test('getFreeBytes throws unimplemented error', () {
      final ExtendsStorageUtilityPlatform storageUtilityPlatform =
          ExtendsStorageUtilityPlatform();

      expect(
        () => storageUtilityPlatform.getFreeBytes(path: ''),
        throwsUnimplementedError,
      );
    });
  });
}

class ExtendsStorageUtilityPlatform extends StorageUtilityPlatform {}
