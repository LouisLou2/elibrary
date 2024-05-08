import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatSessionPage extends StatefulWidget {

  const ChatSessionPage({super.key});

  @override
  _ChatSessionPageState createState() => _ChatSessionPageState();
}

class _ChatSessionPageState extends State<ChatSessionPage>{
  List<int> items = List<int>.generate(20, (int index) => index);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: ()=>Navigator.of(context).pop(),
        ),
        title: Text(
          '聊天 (20)',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            letterSpacing: -1,
          ),
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
      body: ListView.builder(
        itemCount: items.length,
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
            key: ValueKey<int>(items[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              onTap: ()=>Navigator.of(context).pushNamed('/chat_page'),
              contentPadding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 16.w),
              leading: CircleAvatar(
                radius: 30.w,
                child: Text(
                  '李',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 9.0),
                child: Text(
                  '李华',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              subtitle: const Text(
                '你好，我可以借一下《计算机网络》吗？',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Text(
                '10:30',
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
      ),
    );
  }
}
