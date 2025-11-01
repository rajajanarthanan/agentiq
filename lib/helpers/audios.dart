// import 'dart:async';
// import 'dart:typed_data';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:logger/logger.dart';

// final FlutterSoundRecorder _recorder = FlutterSoundRecorder(
//   logLevel: Level.fatal,
// );
// final FlutterSoundPlayer _player = FlutterSoundPlayer(logLevel: Level.fatal);
// WebSocketChannel? _channel;

// Stream<Uint8List>? _stream;

// Future<void> startDuplexAudio(String wsUrl) async {
//   // Connect WebSocket
//   _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

//   // Request mic permission
//   if (!await Permission.microphone.request().isGranted) {
//     throw Exception('Microphone permission not granted');
//   }
//   // Open recorder and player
//   await _recorder.openRecorder();

//   // 🎤 Send mic audio to WebSocket
//   await _recorder.startRecorder(
//     codec: Codec.pcm16,
//     sampleRate: 16000,
//     numChannels: 1,
//     toStream:
//         (StreamController<Uint8List>()
//           ..stream.listen((data) {
//             _channel?.sink.add(data);
//           })),
//   );

//   // 🎧 Receive WebSocket audio
//   await _player.openPlayer();
//   await _player.startPlayerFromStream(
//     codec: Codec.pcm16,
//     sampleRate: 16000,
//     numChannels: 1,
//     bufferSize: 512,
//     interleaved: true,
//   );

//   _channel?.stream.listen((data) {
//     _player.feedUint8FromStream(data);
//     if (data is Uint8List) {
//       print("Received audio data length: ${data.length}");
//     } else {
//       print("Non-Uint8List data: ${data.runtimeType}");
//     }
//   });
// }

// Future<void> stopDuplexAudio() async {
//   await _recorder.stopRecorder();
//   await _recorder.closeRecorder();
//   await _player.stopPlayer();
//   await _player.closePlayer();
//   await _channel?.sink.close();
//   _channel = null;
// }
