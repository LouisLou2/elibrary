import 'dart:ui';

import 'package:elibrary/presentation/page/cupertino_share.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../constant/app_strings.dart';
import '../widget/custom_image_card.dart';
import '../widget/info_display/headline2.dart';

class BookShelf extends StatefulWidget {
  BookShelf({super.key});

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {

  final GlobalKey<TooltipState> tooltipkey=GlobalKey<TooltipState>();
  bool _isSelectionMode = false;
  List<bool> _isSelected = List.generate(20, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                    child: IconButton(
                      onPressed: ()=>showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => CupertinoSharePage(),
                      ),
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(right: 12),
                    child: IconButton(
                        onPressed: ()=>showPullDownMenu(
                        context: context,
                        items: [
                          PullDownMenuItem(
                            onTap: () {},
                            title: '编辑',
                            icon: CupertinoIcons.pen,
                          ),
                          PullDownMenuItem(
                            title: '分享',
                            subtitle: 'Share in different channel',
                            onTap: () {},
                            icon: CupertinoIcons.arrowshape_turn_up_right,
                          ),
                          PullDownMenuItem(
                            onTap: () {},
                            title: '暂时关闭',
                            icon: CupertinoIcons.xmark_circle,
                          ),
                          PullDownMenuItem(
                            onTap: () {},
                            title: '清空',
                            isDestructive: true,
                            icon: CupertinoIcons.delete,
                          ),
                        ],
                        position: Rect.fromPoints(const Offset(400,80), const Offset(500,0)),
                      ),
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: HeadLine2(
                  title: AppStrs.myLib,
                  size: 37,
                  icon: Tooltip(
                    key: tooltipkey,
                    message: AppStrs.publicSpec,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                    ),
                    textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      size: 30,
                    ),
                  ),
                  onTap: ()=>tooltipkey.currentState?.ensureTooltipVisible(),
                ),
              ),
              const Divider(
                height: 8,
                thickness: 1.5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 10,),
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