
import 'dart:ui';

import 'package:elibrary/init_affairs.dart';
import 'package:elibrary/presentation/page/book_detail.dart';
import 'package:elibrary/presentation/page/booking_page.dart';
import 'package:elibrary/presentation/page/main_tabs.dart';
import 'package:elibrary/presentation/page/record_page.dart';
import 'package:elibrary/presentation/page/reservation_detail.dart';
import 'package:elibrary/presentation/page/search_page.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/state_management/theme_prov.dart';
import 'package:elibrary/style/theme_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// Flutter code sample for [TabBar].
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  void initState(){
    super.initState();
    var dispatcher = PlatformDispatcher.instance;
    // This callback is called every time the brightness changes.
    dispatcher.onPlatformBrightnessChanged = () {
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@onPlatformBrightnessChanged");
    };
  }
  @override
  Widget build(BuildContext context) {
    initWhenWidgetBuilding(context);
    return ScreenUtilInit(
      child: MultiProvider(
          providers: ProvManager.widgets(),
          child: Consumer<ThemeProv>(
            builder:(context,prov,_)=>MaterialApp(
              routes: {
                '/book_detail':(context)=>const BookDetail(),
                '/reservation_detail': (context) => const ReservationDetail(),
                '/record':(context)=>const RecordPage(),
                '/booking':(context)=>const BookingPage(),
                '/search':(context)=>const SearchPage(),
              },
              theme: ThemeCollection.light,
              darkTheme: ThemeCollection.dark,
              themeMode: prov.mode,
              home: const MainTabsPage(),
            ),
          )
      ),
    );
  }
}
void main() async{
  initMustBeforeRunApp();
  await initAsync();
  runApp(const MyApp());
}


class HomePagee extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePagee> {
  bool _isSelectionMode = false;
  List<bool> _isSelected = List.generate(20, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView with Selection'),
        actions: [
          IconButton(
            icon: Icon(_isSelectionMode ? Icons.check : Icons.select_all),
            onPressed: () {
              setState(() {
                _isSelectionMode = !_isSelectionMode;
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_isSelectionMode) {
                  _isSelected[index] = !_isSelected[index];
                }
              });
            },
            child: Stack(
              children: [
                Container(
                  color: _isSelected[index] ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                  child: Center(
                    child: Text('Item $index'),
                  ),
                ),
                if (_isSelectionMode && _isSelected[index])
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: IconButton(
                      icon: const Icon(Icons.check_circle),
                      onPressed: () {
                        setState(() {
                          _isSelected[index] = !_isSelected[index];
                        });
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}