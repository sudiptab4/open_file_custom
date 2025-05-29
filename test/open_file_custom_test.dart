import 'package:flutter_test/flutter_test.dart';
import 'package:open_file_custom/open_file_custom.dart';
import 'package:open_file_custom/open_file_custom_platform_interface.dart';
import 'package:open_file_custom/open_file_custom_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpenFileCustomPlatform
    with MockPlatformInterfaceMixin
    implements OpenFileCustomPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future openFile({required String filePath, required String mimeType}) {
    // TODO: implement openFile
    throw UnimplementedError();
  }
}

void main() {
  final OpenFileCustomPlatform initialPlatform = OpenFileCustomPlatform.instance;

  test('$MethodChannelOpenFileCustom is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOpenFileCustom>());
  });

  test('getPlatformVersion', () async {
    OpenFileCustom openFileCustomPlugin = OpenFileCustom();
    MockOpenFileCustomPlatform fakePlatform = MockOpenFileCustomPlatform();
    OpenFileCustomPlatform.instance = fakePlatform;

    expect(await openFileCustomPlugin.getPlatformVersion(), '42');
  });
}
