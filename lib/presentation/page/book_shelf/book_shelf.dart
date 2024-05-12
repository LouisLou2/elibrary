import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elibrary/presentation/page/add_book_confirm_page.dart';
import 'package:elibrary/state_management/prov/user_book_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../../constant/app_strings.dart';
import '../../widget/custom_image_card.dart';
import '../../widget/info_display/headline2.dart';

class BookShelf extends StatefulWidget {
  BookShelf({super.key});

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {

  final GlobalKey<TooltipState> tooltipkey=GlobalKey<TooltipState>();
  final UserBookProv uprov= ProvManager.userBookProv;

  bool _isSelectionMode = false;
  List<bool> _isSelected = List.generate(20, (_) => false);
  String result = '';

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
                      onPressed: () async {
                        // var result = await BarcodeScanner.scan(
                        // options: const ScanOptions(
                        //   autoEnableFlash: false,
                        //   strings: {
                        //     'cancel': 'Cancel',
                        //     'flash_on': 'Flash',
                        //     'flash_off': 'Flash off',
                        //   },
                        // ),
                        // );
                        // print(result.type); // The result type (barcode, cancelled, failed)
                        // print(result.rawContent); // The barcode content
                        // print(result.format); // The barcode format (as enum)
                        // print(result.formatNote); // If a unknown format was scanned this field contains a note,
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const BookConfirmPage();
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: UIParams.defIconS.w,
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
                            title: '添加',
                            icon: CupertinoIcons.add,
                            iconColor: Theme.of(context).colorScheme.primary,
                          ),
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
                        size: UIParams.defIconS.w,
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
                          image: CachedNetworkImage(
                            imageUrl: uprov.bookShelf[index].cover_url,
                            fit: BoxFit.cover,
                            width: 220.w,
                            height: 277.w,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          text: uprov.bookShelf[index].title,
                          //useSolidColor: true,
                          surfaceColor: Colors.white,
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
  Widget _buildKindWidget(String kind){
    return Row(
      children: [
        Icon(
          Icons.done_all,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          kind,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            letterSpacing: -0.7,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
  Widget _buildAvailableWidget({required String item,required BuildContext context, bool isAvailable = true}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.w,vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UIParams.smallBorderR),
        color: isAvailable ? Theme.of(context).colorScheme.primary:Theme.of(context).disabledColor,
      ),
      child: Row(
        children: [
          Icon(
            isAvailable ? Icons.done : Icons.close,
            color: Theme.of(context).colorScheme.surface,
          ),
          SizedBox(width: 5.w),
          Text(
            item,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface
            ),
          ),
        ],
      ),
    );
  }
}