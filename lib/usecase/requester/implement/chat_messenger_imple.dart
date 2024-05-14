import 'dart:convert';

import 'package:elibrary/datasource/ws/websocket_manager_depecated.dart';
import 'package:elibrary/domain/resp_model/user_lending/received_message.dart';
import 'package:elibrary/respository/interface/message_repo.dart';
import 'package:elibrary/respository/interface/user_lend_repo.dart';
import 'package:elibrary/state_management/prov/user_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:get_it/get_it.dart';

import '../../../constant/rescode.dart';
import '../../../datasource/ws/websocket_manager.dart';
import '../../../domain/entity/message.dart';
import '../../../domain/entity/simple_user.dart';
import '../../../domain/req_model/user_lend/message.dart';
import '../../../domain/util_model/res_info.dart';
import '../../../state_management/prov/chat_prov.dart';
import '../interface/chat_messenger.dart';

class ChatMessengerImple extends ChatMessenger {
  final WebSocketManager _webSocketManager = WebSocketManager.instance();
  final MessageRep _messageRepo = GetIt.I<MessageRep>();
  final UserLendRep _userLendRep = GetIt.I<UserLendRep>();
  final UserProv _userProv = ProvManager.userProv;
  final ChatProv _chatProv = ProvManager.chatProv;

  @override
  void receiveMessage(Map<String,dynamic> message) async{
    ReceivedMessage receivedMessage = ReceivedMessage.fromJson(
      message,
    );
    // 将数据存储至数据库以及Provider
    _messageRepo.saveMessage(
      [AppMessage.fromReceivedMessage(
        receivedMessage,
        _userProv.user?.userId??0,
      )]
    );
    // 通知Provider
    _chatProv.addMessage(
      AppMessage.fromReceivedMessage(
        receivedMessage,
        _userProv.user!.userId??0,
      ),
    );
    Result<List<SimpleUser>> userInfoList = await _userLendRep.getUserInfo(
      userIds: [receivedMessage.senderId,],
    );
    if(userInfoList.resCode!=ResCode.SUCCESS){
      return;
    }
    _chatProv.addALatestMessage(
      ChatMessage.fromAppMessage(
        AppMessage.fromReceivedMessage(
          receivedMessage,
          _userProv.user?.userId??0,
        ),
        userInfoList.data![0],
      )
    );
  }

  @override
  void sendMessage(SendMessage message){
    _webSocketManager.sendMessage(message);
  }

}