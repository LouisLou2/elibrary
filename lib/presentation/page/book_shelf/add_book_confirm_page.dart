import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/widget/beautify_widget/fliter_widget.dart';
import 'package:elibrary/presentation/widget/box_groov.dart';
import 'package:elibrary/state_management/prov/book_shelf_prov.dart';
import 'package:elibrary/usecase/handler/user_book_handler.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../../../state_management/prov_manager.dart';
import '../../../style/ui_params.dart';
import '../../general/general_ui_settings.dart';

class BookConfirmPage extends StatefulWidget{
  const BookConfirmPage({super.key});
  @override
  State<BookConfirmPage> createState() => _BookConfirmPageState();
}

class _BookConfirmPageState extends State<BookConfirmPage>{
  final BookShelfProv _bprov = ProvManager.bookshelfProv;

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
                  onPressed: ()=>NavigationHelper.pop(),
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
                    onPressed: putConfirmed,
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
                        child: getCustomCachedImage(
                          url: _bprov.confirmBookInfo.cover_l_url,
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
                    _bprov.confirmBookInfo.title,
                    overflow: TextOverflow.ellipsis,
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
                    _bprov.confirmBookInfo.authorNamesStr,
                    overflow: TextOverflow.ellipsis,
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
                    _buildKindWidget(_bprov.confirmBookInfo.cate1Str),
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
                          '${_bprov.confirmBookInfo.wordCount}',
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
                      '${FormatTool.dateScaleStr(_bprov.confirmBookInfo.pubDate)} 出版',
                      overflow: TextOverflow.ellipsis,
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
                      _bprov.confirmBookInfo.publisher,
                      overflow: TextOverflow.ellipsis,
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
                    _bprov.confirmBookInfo.desc??"暂无简介",
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

  Future<void> putConfirmed() async{
    bool res=await UserBookHandler.addBookToShelf(bookInfo: _bprov.confirmBookInfo);
    if(res){
      NavigationHelper.pop();
    }
  }
}