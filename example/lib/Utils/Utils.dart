import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file_custom/open_file_custom.dart';
import 'package:path_provider/path_provider.dart';

class Utils{
   static Future<void> openAssetFile(String assetPath, String fileName) async {
    final byteData = await rootBundle.load(assetPath);
    final tempDir = await getTemporaryDirectory();
    final tempFilePath = '${tempDir.path}/$fileName';

    final file = File(tempFilePath);
    await file.writeAsBytes(byteData.buffer.asUint8List());

    final mimeType = _getMimeType(fileName);
    print("FilePath : $tempFilePath---$mimeType");
    var result = await OpenFileCustom().openFile(filePath: tempFilePath, mimeType: mimeType);
    print("RESULT: $result");
    if (result == "NO_APP") {
     Fluttertoast.showToast(
      msg: "No app found to open this file.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
     );
    }
    // else {
    //   print('Failed to open file: ${result.errorDescription}');
    // }
  }

   static String _getMimeType(String fileName) {
    if (fileName.endsWith('.pdf')) return 'application/pdf';
    if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) return 'image/jpeg';
    if (fileName.endsWith('.png')) return 'image/png';
    if (fileName.endsWith('.doc')) return 'application/msword';
    if (fileName.endsWith('.docx')) return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    if (fileName.endsWith('.xls')) return 'application/vnd.ms-excel';
    if (fileName.endsWith('.xlsx')) return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
    return '*/*';
  }
}