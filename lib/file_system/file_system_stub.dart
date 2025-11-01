import 'dart:typed_data';
import 'package:flutter/foundation.dart';

void saveFile(Uint8List bytes, String filename) {
  if (kDebugMode) {
    print(
      'Warning: File saving is not supported on this platform. '
      'Platform-specific implementations are needed for web, mobile, and desktop.',
    );
  }
  throw UnsupportedError(
    'File saving is not supported on this platform. '
    'Please ensure you have the correct platform-specific implementation.',
  );
}
