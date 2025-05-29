
import 'open_file_custom_platform_interface.dart';

class OpenFileCustom {
  Future<String?> getPlatformVersion() {
    return OpenFileCustomPlatform.instance.getPlatformVersion();
  }

  Future<dynamic> openFile({required String filePath, required String mimeType}) {
    return OpenFileCustomPlatform.instance.openFile( filePath : filePath, mimeType: mimeType);
  }
}
