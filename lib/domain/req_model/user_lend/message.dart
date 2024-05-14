import 'package:elibrary/domain/entity/message.dart';

class SendMessage{
  final int senderId;
  final int receiverId;
  final String message;

  SendMessage({required this.senderId, required this.receiverId, required this.message,});

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'receiver_id': receiverId,
      'message': message,
    };
  }

  factory SendMessage.fromAppMessage(AppMessage appMessage) {
    return SendMessage(
      senderId: appMessage.senderId,
      receiverId: appMessage.receiverId,
      message: appMessage.message,
    );
  }
}