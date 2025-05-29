import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'open_file_custom_platform_interface.dart';

/// An implementation of [OpenFileCustomPlatform] that uses method channels.
class MethodChannelOpenFileCustom extends OpenFileCustomPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('open_file_custom');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<dynamic> openFile({required String filePath, required String mimeType}) async {
    final result = await methodChannel.invokeMethod<String>('openFile',{'filePath': filePath,'mimeType': mimeType});
    return result;
  }
}
