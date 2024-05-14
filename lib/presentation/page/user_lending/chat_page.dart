import 'package:elibrary/domain/entity/message.dart';
import 'package:elibrary/state_management/prov/chat_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/user_chat_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatProv _cprov = ProvManager.chatProv;

  @override
  void initState() {
    super.initState();
  }

  void _handleSendPressed(types.PartialText message) {
    UserChatHandler.sendMessage(
      AppMessage(
        message: message.text,
        senderId: _cprov.sender.userId,
        receiverId: _cprov.receiver.userId,
        time: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
        onPressed: ()=>Navigator.of(context).pop(),
      ),
      title: Text(
        _cprov.receiver.name,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          letterSpacing: -1,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.ellipsis_vertical),
          onPressed: (){},
        ),
        SizedBox(width: UIParams.smallGap.w),
      ],
      centerTitle: true,
    ),
    body: Selector<ChatProv,int>(
      selector: (_, prov){
        final len = prov.nowUiMessagesLength;
        return len;
      },
      builder: (_, list, __){
        return Chat(
          messages: _cprov.nowUiMessages(),
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          user: _cprov.uiSender,
          // onAvatarTap: (types.User _)=>Navigator.of(context).pushNamed('/browse_user'),TODO
          theme: DefaultChatTheme(
            primaryColor: CupertinoColors.systemBlue,
            inputPadding: const EdgeInsets.all(6),
            sendButtonIcon: Icon(
              CupertinoIcons.arrow_up_circle_fill,
              size: 28.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
            inputTextStyle: Theme.of(context).textTheme.bodyLarge??const TextStyle(),
            inputTextColor: Theme.of(context).colorScheme.onSurface,
            inputTextDecoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.surface,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
            ),
            inputContainerDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            seenIcon: const Text(
              'read',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
        );
      }
    ),
  );
}