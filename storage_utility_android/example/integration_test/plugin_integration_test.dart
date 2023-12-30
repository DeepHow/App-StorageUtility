// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final StorageUtilityPlatform utility = StorageUtilityPlatform.instance;

  testWidgets('getFreeBytes test', (WidgetTester tester) async {
    final String path = (await getApplicationDocumentsDirectory()).path;
    final int bytes = await utility.getFreeBytes(path: path);
    expect(bytes > 0, true);
  });

  testWidgets('getTotalBytes test', (WidgetTester tester) async {
    final String path = (await getApplicationDocumentsDirectory()).path;
    final int bytes = await utility.getTotalBytes(path: path);
    expect(bytes > 0, true);
  });
}
