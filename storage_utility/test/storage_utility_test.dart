import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:storage_utility/storage_utility.dart';
import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';

const String kApplicationDocumentsPath = 'applicationDocumentsPath';

class MockStorageUtilityPlatform
    with MockPlatformInterfaceMixin
    implements StorageUtilityPlatform {
  @override
  Future<int> getFreeBytes({required String path}) => Future.value(42);

  @override
  Future<int> getTotalBytes({required String path}) => Future.value(84);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('getFreeBytes', () async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
    StorageUtilityPlatform.instance = MockStorageUtilityPlatform();
    expect(await getFreeBytes(), 42);
  });

  test('getTotalBytes', () async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
    StorageUtilityPlatform.instance = MockStorageUtilityPlatform();
    expect(await getTotalBytes(), 84);
  });
}

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return kApplicationDocumentsPath;
  }
}
