export 'file_system_stub.dart'
    if (dart.library.html) 'file_system_web.dart'
    if (dart.library.io) 'file_system_platform.dart';
