import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_file_custom/open_file_custom_method_channel.dart';

void main() {
  MethodChannelOpenFileCustom platform = MethodChannelOpenFileCustom();
  const MethodChannel channel = MethodChannel('open_file_custom');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
