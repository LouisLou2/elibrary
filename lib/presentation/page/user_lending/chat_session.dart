import 'package:elibrary/domain/entity/message.dart';
import 'package:elibrary/state_management/prov/chat_prov.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/user_book_handler.dart';
import 'package:elibrary/usecase/handler/user_chat_handler.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatSessionPage extends StatefulWidget {

  const ChatSessionPage({super.key});

  @override
  _ChatSessionPageState createState() => _ChatSessionPageState();
}

class _ChatSessionPageState extends State<ChatSessionPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
        title: Selector<ChatProv,int>(
          selector: (context,chatProv)=>chatProv.latestMessageMap.length,
          builder: (context,len,child){
            return Text(
              '聊天 ($len)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                letterSpacing: -1,
              ),
            );
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: (){},
          ),
          SizedBox(width: UIParams.smallGap.w),
        ],
      ),
      body: Selector<ChatProv,List<ChatMessage>>(
        selector: (context,chatProv)=>chatProv.latestMessageList,
        builder: (context,messageList,child){
          return ListView.builder(
            itemCount: messageList.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Theme.of(context).colorScheme.error,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Icon(CupertinoIcons.delete,
                        color: Colors.white,
                      ),
                      SizedBox(width: UIParams.mediumGap.w),
                      Text('删除',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: UIParams.mediumGap.w),
                    ],
                  ),
                ),
                key: ValueKey<ChatMessage>(messageList[index]),
                onDismissed: (DismissDirection direction) {
                  UserChatHandler.deleteChatSession(
                    oneId: messageList[index].senderId,
                    otherId: messageList[index].receiverId,// TODO
                  );
                },
                child: ListTile(
                  onTap: (){
                    UserChatHandler.enterChatPage(
                      receiver: messageList[index].otherUser,
                    );
                  },// TODO
                  contentPadding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
                  leading: CircleAvatar(
                    radius: 30.w,
                    child: Text(
                      messageList[index].otherUser.avatarStr,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 9.0),
                    child: Text(
                      messageList[index].otherUser.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  subtitle: Text(
                    messageList[index].message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: Text(
                    FormatTool.monthDayHourStr(messageList[index].time),
                  ),
                  subtitleTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    letterSpacing: -0.7,
                  ),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 0.3,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
