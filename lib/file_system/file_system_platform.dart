import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveFile(Uint8List bytes, String filename) async {
  try {
    Directory directory;

    if (Platform.isAndroid) {
      // On Android, try to save to Downloads directory
      try {
        directory =
            await getDownloadsDirectory() ??
            await getExternalStorageDirectory() ??
            await getApplicationDocumentsDirectory();
      } catch (e) {
        // Fallback if downloads directory is not available
        directory =
            await getExternalStorageDirectory() ??
            await getApplicationDocumentsDirectory();
      }
    } else if (Platform.isIOS) {
      // On iOS, save to Documents directory (app sandbox)
      directory = await getApplicationDocumentsDirectory();
    } else {
      // On desktop platforms (macOS, Linux, Windows), save to Downloads directory
      try {
        directory =
            await getDownloadsDirectory() ??
            await getApplicationDocumentsDirectory();
      } catch (e) {
        // Fallback to Documents directory if Downloads is not available
        directory = await getApplicationDocumentsDirectory();
      }
    }

    // Ensure directory exists
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    // Create the file path
    final filePath = '${directory.path}${Platform.pathSeparator}$filename';
    final file = File(filePath);

    // Write the file
    await file.writeAsBytes(bytes);

    if (kDebugMode) {
      print('File saved successfully: $filePath');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error saving file: $e');
    }
    // You might want to throw a custom exception here or handle the error differently
    rethrow;
  }
}
