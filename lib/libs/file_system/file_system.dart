export 'file_system_platform.dart'
    if (dart.library.html) 'file_system_web.dart'
    if (dart.library.io) 'file_system_platform.dart';
