class ReceivedMessage {
  final String message;
  final int senderId;
  final DateTime time;

  ReceivedMessage({required this.message, required this.senderId, required this.time,});

  factory ReceivedMessage.fromJson(Map<String, dynamic> json) {
    return ReceivedMessage(
      message: json['message'],
      senderId: json['sender_id'],
      time: DateTime.parse(json['time']),
    );
  }

}