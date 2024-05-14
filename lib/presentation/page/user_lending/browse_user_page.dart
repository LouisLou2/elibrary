import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elibrary/state_management/prov/user_lending_prov.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/user_chat_handler.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../state_management/prov_manager.dart';
import '../../specific_style_widget/text_widget.dart';
import '../../widget/custom_image_card.dart';

class BrowseUserPage extends StatefulWidget {
  const BrowseUserPage({super.key});

  @override
  State<BrowseUserPage> createState() => _BrowseUserPageState();
}

class _BrowseUserPageState extends State<BrowseUserPage> {

  final UserLendingProv _ulprov = ProvManager.userLendingProv;
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
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Text(
                    _ulprov.nowUser.avatarStr,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 45,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Text (
              _ulprov.nowUser.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text (
              _ulprov.nowUser.roleStr,
              overflow: TextOverflow.ellipsis,
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
                _ulprov.nowUser.locationStr,
                overflow: TextOverflow.ellipsis,
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
              onPressed: chatWithHim,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 0),
                child: Selector<UserLendingProv, int>(
                  selector: (_, prov) => prov.nowUserShelf.length,
                  builder: (_, len, __) {
                    if(len == 0) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: len,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomImageCard(
                          image: CachedNetworkImage(
                            imageUrl: _ulprov.nowUserShelf[index].cover_url,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 300,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                          text: _ulprov.nowUserShelf[index].title,
                          //useSolidColor: true,
                          surfaceColor: Colors.white,
                        );
                      }
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
  void chatWithHim(){
    UserChatHandler.enterChatPage(
      receiver: _ulprov.nowUser,
    );
  }
}