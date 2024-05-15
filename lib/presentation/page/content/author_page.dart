import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../specific_style_widget/image_widget.dart';
import '../../widget/image_tile.dart';

class AuthorPage extends StatefulWidget{
  const AuthorPage({Key? key}):super(key:key);

  @override
  State<StatefulWidget> createState()=>_AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 45,
        surfaceTintColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SearchBar(
            hintText: '搜索刘震云的作品',
            hintStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).disabledColor,
              ),
            ),
            constraints: const BoxConstraints(
              maxHeight: 35,
              minHeight: 35,
            ),
            backgroundColor: MaterialStateProperty.all(Theme.of(context).hoverColor),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:ListView(
          children: <Widget>[
            const SizedBox(height: UIParams.mediumGap),
            InkWell(
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  builder: (context){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child:  const SingleChildScrollView(
                        child: SelectionArea(
                          child: Text(
                            'kjjhguiyturyetdfcvhytrtdcgvhgy粉底乳发育讨厌的人发光法当然头发关于u要等他染发烫发韵达让他trdxfcgvgytresrdxfcgvytyr65e4asdfgchvgur56e4s',
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.92,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                          child: Text(
                            '刘',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                        title: Text(
                          '刘震云',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        subtitle: const Text(
                          '67个作品',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        trailing: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(CupertinoColors.systemBlue),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(UIParams.bigBorderR),
                              ),
                            ),
                          ),
                          onPressed: (){},
                          child: Text(
                            '关注',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.9,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Text(
                          '刘震云，男，1964年生，湖南岳阳人，现居北京。著名作家、编剧、文学评论家。毕业于北京大学中文系，曾在《人民文学》、《星星》等刊物任编辑。代表作有《一地鸡毛》、《一座城池》、《一座城的爱情》、《一座城的青春》、《一座城的秋天》、《一座城的夏天》、《一座城的冬天》、《一座城的春天》、《一座城的故事》、《一座城的人》、《一座城的风景》、《一座城的生活》、《一座城的梦》、《一座城的雨》、《一座城的夜》、《一座城的阳光》、《一座城的风》、《一座城的雪》、《一座城的星》、《一座城的月》、《一座城的花》、《一座城的草》、《一座城的树》、《一座城的山》、《一座城的水》、《一座城的云》、《一座城的飞鸟》、《一座城的鱼》、《一座城的猫》、《一座城的狗》、《一座城的猪》、《一座城的牛》、《一座城的马》、《一座城的羊》、《一座城的鸡》、《一座城的鸭》',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: UIParams.largeGap),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(UIParams.smallBorderR),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(20,
                  (index){
                    if(index==0){
                      return Padding(
                        padding: const EdgeInsets.only(left: 18, top: 10),
                        child:Text(
                          '全部作品',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      );
                    }
                    return ImageTile(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      title: 'Dart Apprentice',
                      subTitle: 'Drik Freeman',
                      thirdTitle: '人民邮电出版社',
                      image: getCustomCachedImage(
                        url: 'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                        width: 65,
                        height: 90,
                      ),
                      actionWidget: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        side: BorderSide.none,
                        avatar: Icon(
                          CupertinoIcons.star_fill,
                          size: 15,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        elevation: 10,
                        label: Text(
                          '7668',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),
                        ),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                      ),
                      titleWeight: FontWeight.w500,
                      onTap: () {},
                      fontSize: 18,
                      fontSize3: 12,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}