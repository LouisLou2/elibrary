import 'package:elibrary/datasource/ws/websocket_manager_depecated.dart';
import 'package:elibrary/domain/entity/message.dart';
import 'package:elibrary/domain/entity/simple_user.dart';
import 'package:elibrary/domain/req_model/user_lend/message.dart';
import 'package:elibrary/domain/util_model/notification.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/message_repo.dart';
import 'package:elibrary/respository/interface/user_lend_repo.dart';
import 'package:elibrary/state_management/prov/chat_prov.dart';
import 'package:elibrary/state_management/prov/user_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:elibrary/usecase/requester/interface/chat_messenger.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';

class UserChatHandler {

  static final MessageRep messageRep = GetIt.I<MessageRep>();
  static final UserLendRep userLendRep = GetIt.I<UserLendRep>();
  static final ChatMessenger chatMessenger = GetIt.I<ChatMessenger>();
  static final ChatProv chatProv = ProvManager.chatProv;
  static final UserProv userProv = ProvManager.userProv;

  static enterChatPage({required SimpleUser receiver}) async{
    SimpleUser sender = ProvManager.userProv.user!.toSimpleUser();
    chatProv.enterChatPage(sender: sender, receiver: receiver, notify: false);
    // 获取历史消息, 目前就是全部获取
    if(chatProv.hasChatList(oneId:sender.userId, otherId: receiver.userId)){
      // 跳转
      NavigationHelper.pushNamed(RouteCollector.chat_page);
      return;
    }
    Result<List<AppMessage>> res = await messageRep.getAllMessages(senderId: sender.userId, receiverId: receiver.userId);
    if(res.resCode==ResCode.SUCCESS){
      chatProv.setMessages(res.data!, notify: false);
      // 跳转
      NavigationHelper.pushNamed(RouteCollector.chat_page);
    }else{
      // 错误处理
      AppNotification notification = ResCode.getCorNotification(res.resCode);
      ToastHelper.showToaster(notification);
    }
  }

  static sendMessage(AppMessage message) async{
    // 通知Provider
    chatProv.addMessage(message);
    // websocket发送
    chatMessenger.sendMessage(SendMessage.fromAppMessage(message));
    // 数据库存储
    Result<bool> res = await messageRep.saveMessage([message]);
    if(res.resCode!=ResCode.SUCCESS){
      // 错误处理
      AppNotification notification = ResCode.getCorNotification(res.resCode);
      ToastHelper.showToaster(notification);
    }
  }

  /*---------进入查看会话列表---------*/
  static enterChatSessionPage() async {
    // 先跳转
    NavigationHelper.pushNamed(RouteCollector.chat_session);
    // 从数据库获取每场会话的最新消息
    if(!chatProv.isLatestMessageInited){
      // 先跳转
      Result<List<AppMessage>> res = await messageRep.getLatestMessages(myUserId: userProv.user!.userId);
      if(res.resCode==ResCode.SUCCESS){
        List<AppMessage> messages = res.data!;
        List<int> userIds = [];
        for(AppMessage message in messages){
          if(message.senderId!=userProv.user!.userId){
            userIds.add(message.senderId);
          }else{
            userIds.add(message.receiverId);
          }
        }
        Result<List<SimpleUser>> userInfoRes = await userLendRep.getUserInfo(userIds: userIds);
        if(userInfoRes.resCode!=ResCode.SUCCESS){
          // 错误处理
          AppNotification notification = ResCode.getCorNotification(userInfoRes.resCode);
          ToastHelper.showToaster(notification);
          return;
        }
        List<SimpleUser> users = userInfoRes.data!;
        List<ChatMessage> chatMessages = [];
        for(int i=0;i<messages.length;i++){
          chatMessages.add(ChatMessage.fromAppMessage(messages[i], users[i]));
        }
        chatProv.setLatestMessages(chatMessages, notify: true);
      }else{
        // 错误处理
        AppNotification notification = ResCode.getCorNotification(res.resCode);
        ToastHelper.showToaster(notification);
      }
    }
  }

  static Future<void> deleteChatSession({required int oneId,required int otherId}) async {
    // 先把chatProv的数据删除
    chatProv.deleteChatSession(oneId: oneId, otherId: otherId);
    // 再删除数据库
    Result<bool> res = await messageRep.deleteMessages(oneId: oneId, otherId: otherId);
    if(res.resCode!=ResCode.SUCCESS){
      // 错误处理
      AppNotification notification = ResCode.getCorNotification(res.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}