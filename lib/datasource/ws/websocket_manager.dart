import 'package:elibrary/domain/req_model/user_lend/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../config/config.dart';

class WebSocketManager{
  late IO.Socket _socket;
  static late WebSocketManager _instance;
  factory WebSocketManager.instance(){
    return _instance;
  }
  static void initInstance({
    required Function(Map<String,dynamic>) onMessage,
    required String token,
  }){
    _instance = WebSocketManager(
      onMessage: onMessage,
      token: token,
    );
  }
  WebSocketManager({
    required Function(Map<String,dynamic>) onMessage,
    required String token,
  }){
    _initWebSocket(
      onMessage: onMessage,
      token: token,
    );
  }

  void _initWebSocket({
    required Function(Map<String,dynamic>) onMessage,
    required String token,
  }){
    _socket = IO.io(
      Configs.WEBSOCKET_URL,
      IO.OptionBuilder()
        .setTransports(['websocket'])
        .setExtraHeaders(
          {'Authorization': 'Bearer $token'}
        ).build(),
    );
    _socket.on('chat_message', (data){
      print('chat_message: $data');
      onMessage(data);
    });
  }
  void sendMessage(SendMessage message){
    _socket.emit('chat_message', message);
  }
}