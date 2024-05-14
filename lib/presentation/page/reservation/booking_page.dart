import 'dart:ui';

import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/state_management/prov/theme_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/user_book_handler.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../state_management/prov/reserve_prov.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  final ThemeProv _tprov= ProvManager.themeProv;
  final ReserveProv _rprov= ProvManager.reserveProv;

  @override
  void initState() {
    _rprov.enterPage();
    super.initState();
  }
  void _reserveTheBook() {
    UserBookHandler.reserveBook(
      bookInfo: _rprov.book.bookInfo,
      libId: _rprov.chosenLib,
      dueTime: _rprov.returnTime,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:Stack(
        children: <Widget>[
          // 背景图片
          Positioned.fill(
            child: getCustomCachedImage(
              url: _rprov.book.bookInfo.cover_l_url,
            ),
          ),
          // 模糊效果
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: _tprov.mode==ThemeMode.light ? Colors.black.withOpacity(0.05) : Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          Positioned(
            left: 30.w,
            right: 30.h,
            bottom: 70.w,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6, // 控制容器高度为屏幕的50%
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(UIParams.smallBorderR),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 150),
                  Text(
                    _rprov.book.bookInfo.title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      letterSpacing: -0.8,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _rprov.book.bookInfo.authorNamesStr,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      letterSpacing: -0.8,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: _rprov.isNoLib ? null : ()=> _showDialog(
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 32,
                            // This sets the initial item.
                            scrollController: FixedExtentScrollController(
                              initialItem: 1,
                            ),
                            onSelectedItemChanged: (index)=> _rprov.chooseLib(index),
                            children: List.generate(_rprov.libs.length, (index) =>
                                Center(
                                child: Text(
                                  _rprov.libNameByIndex(index),
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: Selector<ReserveProv, int>(
                          selector: (context,prov)=>prov.chosenLib,
                          builder: (context,libId,__)=>Text(
                            _rprov.isNoLib?'暂无资源':_rprov.chosenLibName,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                  child:
                    Text(
                      '选择归还时间',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        SizedBox(
                          width: 100.w,
                          child: Selector<ReserveProv, int>(
                            selector: (context,prov)=>prov.update,
                            builder: (context,_,__)=>ListWheelScrollView(
                              onSelectedItemChanged: (index)=>_rprov.setAddDays(index),
                              itemExtent: 40,
                              diameterRatio: 1,
                              useMagnifier: true,
                              magnification: 1.5,
                              children: List.generate(LibTranscationInfo.maxKeepDays, (index) {
                                String dayStr = '';
                                if(_rprov.leastBeginDays==0&&index==0){
                                  dayStr = 'TODAY';
                                }else{
                                  dayStr = FormatTool.monthDayStr(_rprov.now.add(Duration(days: _rprov.leastBeginDays + index)));
                                }
                                return Text(dayStr,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      letterSpacing: -2,
                                    ),
                                  );
                                }
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Selector<ReserveProv, int>(
                            selector: (context,prov)=>prov.update,
                            builder: (context,_,__)=>ListWheelScrollView(
                              itemExtent: 40,
                              diameterRatio: 1,
                              useMagnifier: true,
                              magnification: 1.4,
                              onSelectedItemChanged: (index)=>_rprov.setAddHour(index),
                              children: List.generate(LibTranscationInfo.libClose-_rprov.beginHour, (index) {
                                return Text(FormatTool.hourStr(index+_rprov.beginHour),
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child:FilledButton(
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                              ),
                            ),
                            padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 13.h),
                            ),
                          ),
                          onPressed: _reserveTheBook,
                          child: Text(
                            '预约',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 4,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 页面内容
          Positioned(
            left: 72.w,
            right: 72.w,
            top: 45.h,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4, // 控制容器高度为屏幕的50%
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              //       blurRadius: 10,
              //       spreadRadius: 5,
              //     ),
              //   ],
              //   image: const DecorationImage(
              //     image: NetworkImage(
              //       'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
              //     ),
              //     fit: BoxFit.cover,
              //   ),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                child: getCustomCachedImage(
                  url: _rprov.book.bookInfo.cover_l_url,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
      Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}