import 'package:elibrary/domain/req_model/user_lend/message.dart';

abstract class ChatMessenger {
  void sendMessage(SendMessage message);
  void receiveMessage(Map<String ,dynamic> message);
}