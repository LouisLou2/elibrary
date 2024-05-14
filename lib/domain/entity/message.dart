import 'package:elibrary/domain/resp_model/user_lending/received_message.dart';
import 'package:isar/isar.dart';
part 'message.g.dart';

@collection
class AppMessage{
  Id id=Isar.autoIncrement;
  String message;

  @Index(composite: [CompositeIndex('receiverId'), CompositeIndex('time')])
  int senderId;
  int receiverId;
  DateTime time;

  AppMessage({required this.message, required this.senderId, required this.receiverId, required this.time,});

  factory AppMessage.fromReceivedMessage(ReceivedMessage message, int receiverId) {
    return AppMessage(
      message: message.message,
      senderId: message.senderId,
      receiverId: receiverId,
      time: message.time,
    );
  }

  bool belongTo(int oneId, int otherId){
    return (senderId==oneId && receiverId==otherId) || (senderId==otherId && receiverId==oneId);
  }
}