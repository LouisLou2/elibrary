import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../../domain/entity/message.dart';
import '../../domain/entity/simple_user.dart';

class ChatMessage{
  final int senderId;
  final int receiverId;
  final SimpleUser otherUser;
  final String message;
  final DateTime time;
  ChatMessage({required this.senderId, required this.receiverId, required this.otherUser, required this.message, required this.time});
  factory ChatMessage.fromAppMessage(AppMessage message, SimpleUser otherUser) {
    return ChatMessage(
      senderId: message.senderId,
      receiverId: message.receiverId,
      otherUser: otherUser,
      message: message.message,
      time: message.time,
    );
  }
}

class ChatProv with ChangeNotifier {
  String _makeKey(int oneId, int otherId) {
    // 小的id在前
    if (oneId < otherId) {
      return '$oneId:$otherId';
    } else {
      return '$otherId:$oneId';
    }
  }

  // 用于消息列表
  bool _isLatestMessageInited = false;
  bool get isLatestMessageInited => _isLatestMessageInited;
  Map<String,ChatMessage> latestMessageMap = {}; // 最新的消息列表

  // 用于聊天页面
  Map<String,List<AppMessage>> messageMap = {};
  Map<String,List<types.TextMessage>> uiMessageMap = {};
  /*---------now chat page app model---------*/
  late SimpleUser sender;
  late SimpleUser receiver;
  /*----------now chat page ui need--------------------*/
  late types.User uiSender;
  late types.User uiReceiver;
  /*----------changer---------------------*/
  void enterChatPage({required SimpleUser sender, required SimpleUser receiver, bool notify = true}) {
    this.sender = sender;
    this.receiver = receiver;
    uiSender = _toUiUser(sender);
    uiReceiver = _toUiUser(receiver);
    if (notify) notifyListeners();
  }

  void addMessage(AppMessage message, {bool notify = true}) {
    // 如果原本messageMap没有这个chater，那么这里就不更新messageMap, 这是为了保证messageMap的完全性
    // message是最新的
    String chater = _makeKey(message.senderId, message.receiverId);
    if (messageMap.containsKey(chater)) {
      messageMap[chater]!.insert(0, message);
      uiMessageMap[chater]!.insert(0, _toUiTextMessage(message));
      if (notify){
        notifyListeners();
      }
    }
  }

  void setMessages(List<AppMessage> messages, {bool notify = true}) {
    if(messages.isEmpty) return;
    // 这里的messages必须是同一组用户
    // messages是从新到旧的顺序
    String chater = _makeKey(messages[0].senderId, messages[0].receiverId);
    messageMap[chater] = messages;
    uiMessageMap[chater] = messages.map((e) => _toUiTextMessage(e)).toList();
    if (notify) notifyListeners();
  }

  // 用于消息列表
  void setLatestMessages(List<ChatMessage> messages, {bool notify = true}) {
    if(messages.isEmpty) return;
    // 这里的messages必须是同一组用户
    // messages是从新到旧的顺序
    for(var message in messages) {
      String chater = _makeKey(message.senderId, message.receiverId);
      latestMessageMap[chater] = message;
    }
    _isLatestMessageInited = true;
    if (notify) notifyListeners();
  }
  void addALatestMessage(ChatMessage message, {bool notify = true}) {
    // 删除原来的“最新消息”
    String chater = _makeKey(message.senderId, message.receiverId);
    latestMessageMap[chater] = message;
    if (notify) notifyListeners();
  }
  void deleteChatSession({required int oneId,required int otherId, bool notify = true}) {
    String chater = _makeKey(oneId, otherId);
    latestMessageMap.remove(chater);
    messageMap.remove(chater);
    uiMessageMap.remove(chater);
    messageMap[chater] = [];// 保证messageMap的完整性，如果将key完全删除，那么在下次addMessage时就会出错
    uiMessageMap[chater] = [];
    if (notify) notifyListeners();
  }

  /*---------adaptor----------------------*/
  types.User _toUiUser(SimpleUser user) {
    return types.User(
      id: user.userId.toString(),
      firstName: user.name,
    );
  }
  types.User _getUiUser(int senderId) {
    if (senderId == sender.userId) {
      return uiSender;
    } else {
      return uiReceiver;
    }
  }
  types.TextMessage _toUiTextMessage(AppMessage message){
    return types.TextMessage(
      author: _getUiUser(message.senderId),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: '${message.senderId}:${message.receiverId}:${message.time.millisecondsSinceEpoch}',
      text: message.message,
    );
  }
  /*---------getter----------------------*/
  List<types.TextMessage> getUiMessages({required oneId, required int otherId}) {
    String chater = _makeKey(oneId, otherId);
    if (uiMessageMap.containsKey(chater)) {
      return uiMessageMap[chater]!;
    } else {
      return [];
    }
  }
  List<types.TextMessage> nowUiMessages() {
    return getUiMessages(oneId: sender.userId, otherId: receiver.userId);
  }

  int get nowUiMessagesLength {
    String chater = _makeKey(sender.userId, receiver.userId);
    if (uiMessageMap.containsKey(chater)) {
      return uiMessageMap[chater]!.length;
    } else {
      return 0;
    }
  }

  bool hasChatList({required oneId, required int otherId}) {
    String chater = _makeKey(oneId, otherId);
    return messageMap.containsKey(chater);
  }

  List<ChatMessage> get latestMessageList {
    return latestMessageMap.values.toList();
  }
}