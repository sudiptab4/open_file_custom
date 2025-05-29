
# 📂 open_file_custom

A Flutter plugin to **open files natively** using Android intents with MIME type support. Supports opening `.pdf`, `.doc`, `.xls`, `.jpg`, `.png`, and many more directly from the file path — even from copied asset files.

---

## ✨ Features

✅ Open local files with correct MIME types  
✅ Handles missing apps gracefully (`NO_APP` result)  
✅ Uses Android native intents (via Java)  
✅ Support for Android 7.0+ `FileProvider`  
✅ Clean error handling: `FILE_NOT_FOUND`, `OPEN_ERROR`  
✅ Dart wrapper for ease of use  
✅ Built for extendability

---

## 🔧 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  open_file_custom: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 🛠️ Android Setup

In `AndroidManifest.xml`, add inside `<application>`:

```xml
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
    <meta-data
        android:name="android.support.FILE_PROVIDER_PATHS"
        android:resource="@xml/file_paths"/>
</provider>
```

Create the file `android/app/src/main/res/xml/file_paths.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="http://schemas.android.com/apk/res/android">
    <external-path name="external_files" path="." />
    <files-path name="files" path="." />
    <cache-path name="cache" path="." />
</paths>
```

---

## 🚀 Usage

```dart
import 'package:open_file_custom/open_file_custom.dart';

final openFilePlugin = OpenFileCustom();

final result = await openFilePlugin.openFile(
  filePath: '/storage/emulated/0/Download/sample.pdf',
  mimeType: 'application/pdf',
);

if (result == "opened") {
  print("File opened successfully.");
} else if (result == "NO_APP") {
  print("No app found to open this file type.");
}
```

---

## 📦 Example

Open a PDF from assets (with `path_provider` and `rootBundle`):

```dart
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<void> openAssetFile(String assetPath, String fileName) async {
  final bytes = await rootBundle.load(assetPath);
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/$fileName');
  await file.writeAsBytes(bytes.buffer.asUint8List());

  await OpenFileCustom().openFile(filePath: file.path, mimeType: 'application/pdf');
}
```

---

## 🧪 Result Codes

| Result       | Meaning                             |
|--------------|-------------------------------------|
| `opened`     | File opened successfully            |
| `NO_APP`     | No app found to open the file       |
| `FILE_NOT_FOUND` | File path doesn't exist        |
| `OPEN_ERROR` | An error occurred during opening    |

---

## 🧩 Platform Support

| Platform | Support |
|----------|---------|
| Android  | ✅ Yes   |
| iOS      | ❌ Not yet |

> iOS support coming soon. PRs welcome!

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## ✍️ Author

Maintained by **Sudipta Samanta** (<sudiptauem93@gmail.com>).  
Feel free to contribute, suggest features, or fork the project.
