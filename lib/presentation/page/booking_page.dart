import 'dart:ui';

import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> _libNames = <String>[
  '新校区图书馆',
  '校本部图书馆',
  '铁道校区图书馆',
  '南校区没图书馆',
  '湘雅图书馆',
  '一个图书馆',
];

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:Stack(
        children: <Widget>[
          // 背景图片
          Positioned.fill(
            child: Image.network(
              'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // 模糊效果
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: Colors.black.withOpacity(0.05),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 150),
                  Text(
                    'Dart Apprentice',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      letterSpacing: -0.8,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Jayson DeMers',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      letterSpacing: -0.8,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(width: UIParams.smallGap.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: ()=>_showDialog(
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 32,
                            // This sets the initial item.
                            scrollController: FixedExtentScrollController(
                              initialItem: 1,
                            ),
                          // This is called when selected item is changed.
                            onSelectedItemChanged: null,
                            children: List.generate(_libNames.length, (index) =>
                                Center(
                                child: Text(
                                  _libNames[index],
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          '校本部图书馆',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        SizedBox(
                          width: 100.w,
                          child:ListWheelScrollView(
                            itemExtent: 40,
                            diameterRatio: 1,
                            useMagnifier: true,
                            magnification: 1.5,
                            children: [
                              Text('TODAY',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  letterSpacing: -2,
                                ),
                              ),
                              Text('SUN',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  letterSpacing: -2,
                                ),
                              ),
                              Text('MON',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  letterSpacing: -2,
                                ),
                              ),
                              Text('TUE',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  letterSpacing: -2,
                                ),
                              ),
                              Text('WEDN',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  letterSpacing: -2,
                                ),
                              ),
                              Text('THUR',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  letterSpacing: -2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100.w,
                          child:ListWheelScrollView(
                            itemExtent: 40,
                            diameterRatio: 1,
                            useMagnifier: true,
                            magnification: 1.4,
                            children: [
                              Text('09:00',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('10:00',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('11:00',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('12:00',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('13:00',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('14:00',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
                          onPressed: ()=>Navigator.of(context).pushNamed('/reservation_detail'),
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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
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