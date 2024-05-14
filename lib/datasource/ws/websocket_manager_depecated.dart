// import 'dart:io';
// import 'dart:ui';
//
// import 'package:elibrary/config/config.dart';
// import 'package:elibrary/domain/req_model/user_lend/message.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// class WebSocketManagerDeprecated {
//   late WebSocketChannel _wsChannel;
//   static late WebSocketManager _instance;
//   // 此类将做成单例
//   // 用于管理WebSocket连接
//   factory WebSocketManager.instance(){
//     return _instance;
//   }
//   // 在instance()方法之前调用此方法，用于初始化WebSocketManager
//   static void initInstance({
//     required VoidCallback onOpen,
//     required Function(String) onMessage,
//     required VoidCallback onError,
//     required int userId,
//   }){
//     _instance = WebSocketManager(
//       onOpen: onOpen,
//       onMessage: onMessage,
//       onError: onError,
//       userId: userId,
//     );
//   }
//   // 最主要的方法，用于初始化WebSocket连接
//   WebSocketManager({
//     required VoidCallback onOpen,
//     required Function(String) onMessage,
//     required VoidCallback onError,
//     required int userId,
//   }){
//     _initWebSocket(
//       onOpen: onOpen,
//       onMessage: onMessage,
//       onError: onError,
//       userId: userId,
//     );
//   }
//
//   Future<void> _initWebSocket({
//     required VoidCallback onOpen,
//     required Function(String) onMessage,
//     required VoidCallback onError,
//     required int userId,
//   }) async {
//     final wsUrl= Uri.parse(Configs.WEBSOCKET_URL,);
//     final wsUrll=Uri(
//       scheme: wsUrl.isScheme("wss") ? "https" : "http",
//       host: wsUrl.host,
//       port: wsUrl.port,
//       path: wsUrl.path,
//       userInfo: wsUrl.userInfo,
//       query: wsUrl.query,
//       fragment: wsUrl.fragment,
//       queryParameters: wsUrl.queryParameters,
//     );
//     // 初始化WebSocket连接
//     _wsChannel = IOWebSocketChannel.connect(
//       wsUrll,
//     );
//     await _wsChannel.ready;
//     _wsChannel.stream.listen((event) {
//       onMessage(event.toString());
//     }, onError: (error) {
//       onError();
//     }, onDone: () {
//       onError();
//     });
//     sendAuthMessage(userId);
//     print('WebSocketManager init success');
//   }
//
//   void sendAuthMessage(int userId){
//     _wsChannel.sink.add('{"authenticate":$userId}');
//   }
//
//   void sendMessage(SendMessage message){
//     _wsChannel.sink.add(message.toJson());
//   }
// }