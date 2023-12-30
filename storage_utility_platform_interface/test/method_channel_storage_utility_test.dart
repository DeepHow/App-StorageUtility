import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage_utility_platform_interface/src/method_channel_storage_utility.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelStorageUtility platform = MethodChannelStorageUtility();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      platform.methodChannel,
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getFreeBytes':
            return 42;
          case 'getTotalBytes':
            return 84;
          default:
            return UnimplementedError();
        }
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(platform.methodChannel, null);
  });

  test('getFreeBytes', () async {
    expect(await platform.getFreeBytes(path: ''), 42);
  });

  test('getTotalBytes', () async {
    expect(await platform.getTotalBytes(path: ''), 84);
  });
}
