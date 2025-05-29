import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'open_file_custom_method_channel.dart';

abstract class OpenFileCustomPlatform extends PlatformInterface {
  /// Constructs a OpenFileCustomPlatform.
  OpenFileCustomPlatform() : super(token: _token);

  static final Object _token = Object();

  static OpenFileCustomPlatform _instance = MethodChannelOpenFileCustom();

  /// The default instance of [OpenFileCustomPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpenFileCustom].
  static OpenFileCustomPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpenFileCustomPlatform] when
  /// they register themselves.
  static set instance(OpenFileCustomPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  Future<dynamic> openFile({required String filePath, required String mimeType}) {
    throw UnimplementedError('getting openFile() has not been implemented.');
  }
}
