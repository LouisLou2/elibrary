import 'dart:convert';

import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final List<types.Message> _messages = [];
  final _user2 = const types.User(
    firstName: 'jack',
    lastName: 'anderson',
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ab',
  );
  final _user = const types.User(
    firstName: 'leo',
    lastName: 'lou',
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  void initState() {
    super.initState();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
      _messages.add(
          types.TextMessage(
            author: _user2,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            id: '${DateTime.now().millisecondsSinceEpoch*10}',
            text: 'Hello, world!',
          )
      );
      print(_messages.length);
    });
  }


  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      text: message.text,
      id: '${DateTime.now().millisecondsSinceEpoch}',
    );
    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(CupertinoIcons.back),
        onPressed: ()=>Navigator.of(context).pop(),
      ),
      title: Text(
        'Jack  Anderson',
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
    body: Chat(
      messages: _messages,
      onSendPressed: _handleSendPressed,
      showUserAvatars: true,
      showUserNames: true,
      user: _user,
      onAvatarTap: (types.User _)=>Navigator.of(context).pushNamed('/browse_user'),
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
    ),
  );
}