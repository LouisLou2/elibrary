import 'package:elibrary/constant/situation_enum.dart';
import 'package:elibrary/extension/core_extension.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/presentation/widget/beautify_widget/fliter_widget.dart';
import 'package:elibrary/presentation/widget/box_groov.dart';
import 'package:elibrary/presentation/widget/text_action_widget.dart';
import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/usecase/handler/author_handler.dart';
import 'package:elibrary/usecase/handler/user_book_handler.dart';
import 'package:elibrary/usecase/handler/user_lend_handler.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../../../domain/entity/book_info.dart';
import '../../../state_management/prov_manager.dart';
import '../../../style/ui_params.dart';
import '../../general/general_ui_settings.dart';
import '../../widget/Image_card_with_info.dart';
import '../../widget/info_display/desc_bottomsheet.dart';

class BookDetail extends StatefulWidget{
  const BookDetail({super.key});
  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail>{
  final ContentProv _cprov = ProvManager.contentProv;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,// must set to true
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.h),
        child: FilterWidget(
          sigmaX: 18,
          sigmaY: 18,
          child: AppBar(
            systemOverlayStyle: GeneralUISettings.sysUIOverlayStyle_light,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: Text(
              _cprov.currentDetailBook.bookInfo.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                letterSpacing: -0.6,
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            leading: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.more_vert,
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
                child: _cprov.currentDetailBook.canReadOnline() ? FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary.withOpacity(0.12)),
                  ),
                  onPressed: (){
                    NavigationHelper.pushNamed(RouteCollector.ebook_preview);
                  },
                  child: Text(
                    AppStrs.readOnline,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ):
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary.withOpacity(0.12)),
                  ),
                  onPressed: ()=>_notifyWarning(AppStrs.cantReadOnline),
                  child: Text(
                    AppStrs.cantReadOnline,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              )
            ),
            SizedBox(width: UIParams.mediumGap.w),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 40.h,
                ),
                child: _cprov.currentDetailBook.available() ? FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
                  ),
                  onPressed: ()=> UserBookHandler.enterReservePage(_cprov.currentDetailBook),
                  child: Text(
                    AppStrs.toBorrow,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ):
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
                  ),
                  onPressed: ()=>_notifyWarning(AppStrs.noResouce),
                  child: Text(
                    AppStrs.noResouce,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
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
                  child: Hero(
                    tag: _cprov.currentDetailBook.bookInfo.isbn,
                    child:Container(
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
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                        child: getCustomCachedImage(
                          // TODO: 这列url应该有一个错误url,而不是空字符串
                          url: _cprov.currentDetailBook.bookInfo.cover_l_url??'',
                          //TODO: 这里尺寸太随便了
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
                      _cprov.currentDetailBook.bookInfo.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.7,
                      fontSize: 21,
                    ),
                  ),
                ),
                const SizedBox(height: UIParams.smallGap,),
                getAuthorButton(
                  ids: _cprov.currentDetailBook.bookInfo.authorIds,
                  names: _cprov.currentDetailBook.bookInfo.authorNames,
                ),
                SizedBox(height: UIParams.mediumGap.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildKindWidget(_cprov.currentDetailBook.bookInfo.cate1Str),
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
              ]
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
                          '${_cprov.currentDetailBook.bookInfo.wordCount}',
                          overflow: TextOverflow.ellipsis,
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
                      '${FormatTool.dateScaleStr(_cprov.currentDetailBook.bookInfo.pubDate)} 出版',
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
                      FormatTool.trimText(_cprov.currentDetailBook.bookInfo.publisher,maxLength: 10),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        letterSpacing: -1,
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
                    _cprov.currentDetailBook.bookInfo.desc??'',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      letterSpacing: -0.8,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: onTapshowDescButton,
                  child: Text(
                    '展开',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      letterSpacing: -0.8,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: UIParams.mediumGap.h),
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
                  color: Theme.of(context).colorScheme.primary,
                ),
                BoxGroove(
                  widgets: ListExtension.separate<Widget>(
                    len: _cprov.currentDetailBook.owners!.length,
                    separatorGenerator: (index)=>SizedBox(width: UIParams.smallGap.h),
                    generator: (index)=>_buildAvailableWidget(item: _cprov.currentDetailBook.owners![index].libName, context: context),
                  ),
                ),
                SizedBox(height: UIParams.mediumGap.h),
                TextActionWidget(
                  surfaceColor: Theme.of(context).colorScheme.primary,
                  onTap: _attemptToBorrowFromUser,
                  text: SpecTextWidget.smallTitle(
                    text:'向其他读者借阅',
                    context: context,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: UIParams.largerGap.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '其他版本',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    letterSpacing: -0.8,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Divider(
                  height: 15.h,
                  color: Theme.of(context).colorScheme.primary,
                ),
                BoxGroove(
                  widgets: List.generate(2,
                        (index) => ImageInfoBox(
                      image: Image.network(
                        'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                        fit: BoxFit.cover,
                        width: 130,
                        height: 180,
                      ),
                      title: '愤怒的葡萄',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: UIParams.largerGap.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: BoxGroove(
                title: SpecTextWidget.smallTitle(text: '更多Jonathon Sandusky作品',context: context),
                widgets: List.generate(2,
                      (index) => ImageInfoBox(
                    image: Image.network(
                      'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                      fit: BoxFit.cover,
                      width: 130,
                      height: 180,
                    ),
                    title: '愤怒的葡萄',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: UIParams.largerGap.h),
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
  void _notifyWarning(String title){
    ToastHelper.showToasterWithParam(
      title: title,
      situaCode: SituationEnum.WARNING,
    );
  }

  void _attemptToBorrowFromUser(){
    UserLendHandler.enterUserListPage(_cprov.currentDetailBook.bookInfo);
  }

  void onTapshowDescButton(){
    showDescBottomSheet(
      context: context,
      title: '书籍简介',
      desc: _cprov.currentDetailBook.bookInfo.desc,
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }

  Widget getAuthorButton({required List<int> ids, required List<String> names}){
    return Align(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
            ids.length*2-1, (index){
          if(index.isEven){
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: ()=>authorButtonTapped(ids[index~/2]),
              child: Text(
                names[index~/2],
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  letterSpacing: -0.7,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          }
          return Text(
              '/',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          }
        ),
      ),
    );
  }
  void authorButtonTapped(int authorId){
    AuthorHanler.enterAuthorDetail(authorId);
  }
}