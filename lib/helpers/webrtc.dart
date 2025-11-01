// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';
// import 'package:http/http.dart' as http;

// RTCVideoRenderer renderer = RTCVideoRenderer();

// class WebRTCClient {
//   final String signalingUrl;
//   RTCPeerConnection? _peerConnection;
//   MediaStream? _localStream;
//   MediaStream? _remoteStream;
//   String? token;
//   Map<String, dynamic> data;
//   final Future<void> Function() onDisconnected;
//   WebRTCClient({
//     required this.signalingUrl,
//     this.token,
//     this.data = const {},
//     this.onDisconnected = _defaultOnDisconnected,
//   });

//   static Future<void> _defaultOnDisconnected() async {}
//   Future<void> connect() async {
//     // 1. Create peer connection
//     final config = {
//       'iceServers': [
//         {'urls': 'stun:stun.l.google.com:19302'},
//       ],
//     };

//     _peerConnection = await createPeerConnection(config);

//     // 2. Get user audio stream
//     _localStream = await navigator.mediaDevices.getUserMedia({
//       'audio': true,
//       'video': false,
//     });

//     // 3. Add tracks to peer connection
//     _localStream!.getTracks().forEach((track) {
//       _peerConnection!.addTrack(track, _localStream!);
//     });

//     // 4. Handle remote tracks
//     _peerConnection!.onTrack = (event) {
//       if (event.streams.isNotEmpty) {
//         _remoteStream = event.streams[0];
//         renderer.srcObject = _remoteStream;
//         renderer.initialize();
//         print("Remote stream received");
//       }
//     };

//     //// register callback on peer disconnected
//     _peerConnection!.onConnectionState = (state) async {
//       if (state == RTCPeerConnectionState.RTCPeerConnectionStateDisconnected) {
//         print("Peer connection disconnected");
//         await onDisconnected();
//       }
//     };

//     // 5. Create offer
//     final offer = await _peerConnection!.createOffer();
//     await _peerConnection!.setLocalDescription(offer);

//     // 6. Send offer to Python signaling server
//     final response = await http.post(
//       Uri.parse(signalingUrl),
//       headers: {'Content-Type': 'application/json', 'Accept': '*/*'},
//       body: jsonEncode({
//         'sdp': offer.sdp,
//         'type': offer.type,
//         'token': token ?? "",
//         ...data,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final answer = RTCSessionDescription(data['sdp'], data['type']);
//       await _peerConnection!.setRemoteDescription(answer);
//       print("Connected to signaling server");
//     } else {
//       throw Exception('Failed to connect: ${response.statusCode}');
//     }
//   }

//   Future<void> dispose() async {
//     await _peerConnection?.close();
//     await _localStream?.dispose();
//     _peerConnection = null;
//     _localStream = null;
//     _remoteStream = null;
//   }

//   MediaStream? get localStream => _localStream;
//   MediaStream? get remoteStream => _remoteStream;
//   bool get isDisconnected =>
//       _peerConnection?.connectionState ==
//       RTCPeerConnectionState.RTCPeerConnectionStateDisconnected;

//   RTCPeerConnection? get peerConnection => _peerConnection;
// }

// // RTCVideoRenderer createRenderer() {
// //   final renderer = RTCVideoRenderer();
// //   renderer.initialize();
// //   return renderer;
// // }

// class RTCWidget extends StatelessWidget {
//   const RTCWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Visibility(visible: false, child: RTCVideoView(renderer)),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 2),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     );
//   }
// }
