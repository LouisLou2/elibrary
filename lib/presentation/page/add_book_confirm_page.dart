import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/presentation/widget/beautify_widget/fliter_widget.dart';
import 'package:elibrary/presentation/widget/box_groov.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_strings.dart';
import '../../style/ui_params.dart';
import '../general/general_ui_settings.dart';
import '../widget/Image_card_with_info.dart';

class BookConfirmPage extends StatefulWidget{
  const BookConfirmPage({super.key});
  @override
  State<BookConfirmPage> createState() => _BookConfirmPageState();
}

class _BookConfirmPageState extends State<BookConfirmPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,// must set to true
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: FilterWidget(
          sigmaX: 18,
          sigmaY: 18,
          child: AppBar(
            automaticallyImplyLeading: false,
            systemOverlayStyle: GeneralUISettings.sysUIOverlayStyle_light,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: ()=>Navigator.of(context).pop(),
                icon: Icon(
                  CupertinoIcons.xmark_circle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        surfaceTintColor: Colors.transparent,
        color: Theme.of(context).colorScheme.background,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 40.h,
                ),
                child:FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary.withOpacity(0.12)),
                  ),
                  onPressed: null,
                  child: Text(
                    AppStrs.cancel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: UIParams.mediumGap.w),
            Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: 40.h,
                  ),
                  child:FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary.withOpacity(0.9)),
                    ),
                    onPressed: ()=>Navigator.of(context).pushNamed('/booking'),
                    child: Text(
                      AppStrs.put_book,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top:35.h,bottom: 10.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: 'bookCover',
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                        child: Image.network(
                          'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Dart Apprentice',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.7,
                      fontSize: 21,
                    ),
                  ),
                ),
                const SizedBox(height: UIParams.smallGap,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Author: Jonathon Sandusky',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      letterSpacing: -0.7,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: UIParams.mediumGap.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKindWidget('Programming'),
                  ],
                ),
                SizedBox(height: UIParams.mediumGap.h),
                Text(
                  '信息',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    letterSpacing: -0.8,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '评分',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        letterSpacing: -0.8,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      '3.9',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.7,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      '来自豆瓣',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        letterSpacing: -0.8,
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '作者',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        letterSpacing: -0.8,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 33,
                    ),
                    Text(
                      '更多信息',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        letterSpacing: -0.8,
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '字数',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        letterSpacing: -0.8,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '397',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.7,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          '千字',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.8,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '2021.12.6 出版',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        letterSpacing: -0.8,
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '版权信息',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        letterSpacing: -0.8,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Icon(
                      Icons.copyright,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 33,
                    ),
                    Text(
                      '人民邮电出版社',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        letterSpacing: -0.8,
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: UIParams.largeGap.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '简介',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    letterSpacing: -0.8,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Divider(
                  height: 15.h,
                  thickness: 1.0,
                  indent: 0,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SelectionArea(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    """There are many programming languages you can start learning today. But not many are as modern, easy to learn, object-oriented and scalable as Dart. Plus, combined with Flutter, Dart allows you to build native iOS, Android, web and desktop applications with a single code base. Dart Apprentice will teach you all the basic concepts you need to master this language. Follow along with the clearly and thoroughly explained concepts and you’ll be building Dart applications in a breeze.""",
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      letterSpacing: -0.8,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: UIParams.largeGap.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '资源',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    letterSpacing: -0.8,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Divider(
                  height: 15.h,
                  thickness: 1.0,
                ),
                BoxGroove(
                  widgets: [
                    _buildAvailableWidget(item: '校本部图书馆', context: context),
                    SizedBox(width: UIParams.smallGap.w),
                    _buildAvailableWidget(item: '新校区图书馆', context: context),
                    SizedBox(width: UIParams.smallGap.w),
                    _buildAvailableWidget(item: '铁道校区图书馆', context: context,isAvailable: false),
                  ],
                ),
              ],
            ),
          ),
        ],
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