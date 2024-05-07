import 'dart:ui';

import 'package:elibrary/presentation/page/add_book_confirm_page.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../constant/app_strings.dart';
import '../specific_style_widget/text_widget.dart';
import '../widget/custom_image_card.dart';
import '../widget/image_tile.dart';
import '../widget/info_display/headline2.dart';
import '../widget/setting_section.dart';

class BrowseUserPage extends StatefulWidget {
  const BrowseUserPage({super.key});

  @override
  State<BrowseUserPage> createState() => _BrowseUserPageState();
}

class _BrowseUserPageState extends State<BrowseUserPage> {

  final GlobalKey<TooltipState> tooltipkey=GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        toolbarHeight: 30.h,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.of(context).pushNamed('/book_detail'),
            icon: Icon(
              CupertinoIcons.share,
              color: Theme.of(context).colorScheme.secondary,
              size: UIParams.medIconS.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            child: IconButton(
              onPressed: ()=>Navigator.of(context).pushNamed('/book_detail'),
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.secondary,
                size: UIParams.medIconS.w,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children:[
            Padding(
              padding: EdgeInsets.only(top: UIParams.mediumGap.h, bottom: UIParams.mediumGap.h),
              child: Container(
                padding: const EdgeInsets.all(UIParams.defAvatarRingInterval), // 边框到CircleAvatar的距离，可以根据需要设置
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // 装饰器形状设为圆形
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary, // 边框颜色
                    width: UIParams.defAvatarBorderW, // 边框宽度
                  ),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/avatar1.png',
                  ),
                ),
              ),
            ),
            Text (
              '谷森森',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text (
              '同学',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: UIParams.smallGap.h,),
            Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(UIParams.bigBorderR),
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1.5,
              ),
              label: Text(
                '铁道校区',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SizedBox(height: UIParams.smallGap.h,),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  CupertinoColors.systemBlue,
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 98.w,vertical: 10.h),
                child: Wrap(
                  children: [
                    Icon(
                      CupertinoIcons.chat_bubble_text,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    SizedBox(width: 5.w,),
                    Text(
                      '和Ta聊聊',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: UIParams.mediumGap.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SpecTextWidget.mediumTitle(
                  text: 'Ta的其他书籍',
                  context: context,
                ),
              )
            ),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 0),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return CupertinoContextMenu(
                      enableHapticFeedback: false,
                      actions: [
                        CupertinoContextMenuAction(
                          trailingIcon: CupertinoIcons.share,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('分享'),
                        ),
                        CupertinoContextMenuAction(
                          isDestructiveAction: true,
                          trailingIcon: CupertinoIcons.delete,
                          child: const Text('下架'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      child: CustomImageCard(
                          image: Image.network(
                            'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 300,
                          ),
                          text: 'Dart Apprentice',
                          //useSolidColor: true,
                          surfaceColor: Colors.white
                      ),
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