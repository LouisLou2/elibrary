import 'dart:io';
import 'dart:ui';

import 'package:elibrary/config/test_device.dart';
import 'package:elibrary/init_affairs.dart';
import 'package:elibrary/presentation/page/main_tabs.dart';
import 'package:elibrary/presentation/page/onboarding_page.dart';
import 'package:elibrary/presentation/page/reservation/booking_page.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/state_management/prov/theme_prov.dart';
import 'package:elibrary/style/theme_collection.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:elibrary/usecase/nav/route_generator.dart';
import 'package:elibrary/usecase/requester/implement/auth_requester_imple.dart';
import 'package:elibrary/usecase/requester/interface/auth_requester.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'datasource/network/manage/network_config.dart';
import 'domain/entity/user.dart';
import 'domain/util_model/res_info.dart';

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
    final deviceSize = TestDeviceCollection.mobile;
    return ScreenUtilInit(
      child: MultiProvider(
        providers: ProvManager.widgets(),
        child: ToastificationWrapper(
          child: Consumer<ThemeProv>(
            builder:(context,prov,_)=>MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: RouteCollector.simpleRouteMap,
              theme: ThemeCollection.light,
              darkTheme: ThemeCollection.dark,
              themeMode: prov.mode,
              navigatorKey: NavigationHelper.key,
              onGenerateRoute: RouteGenerator.generateRoute,
              home: _getHome(),
              builder: EasyLoading.init(),
            ),
          ),
        ),
      ),
    );
  }
  Widget _getHome(){
    if(ProvManager.userProv.isLogin){
      return const MainTabsPage();
    }else{
      return const OnBoardingPage();
    }
  }
}
void main() async{
  await initMustBeforeRunApp();
  initAsync();
  runApp(const MyApp());
}

// void main() {
//   // Dart client
//   IO.Socket socket = IO.io(
//     'ws://192.168.24.144:5000',
//     IO.OptionBuilder()
//         .setTransports(['websocket']) // disable auto-connection
//         .build(),
//   );
//   socket.onConnect((_) {
//     print('connect');
//     socket.emit('msg', 'test');
//   });
//   socket.on('event', (data) => print(data));
//   socket.onDisconnect((_) => print('disconnect'));
//   socket.on('fromServer', (_) => print(_));
// }

// void main() async{
//   await testAuth();
// }
// Future<void> testAuth() async {
//   ProvManager.init();
//   NetworkConfig.init();
//   AuthReq authReq=AuthRequesterImple();
//
//   String email='8209220125@csu.edu.cn';
//
//   Result<bool> reqCodeRes= await authReq.requestEmailCode(email);
//   //read email code from console
//   String code= '447398';
//   Result<User> userRes = await authReq.loginWithEmailCode(email, code);
//   ProvManager.userProv.setUser(userRes.data);
//   // begin set pwd
//   String password='abc123';
//   Result<bool> setPedRes= await authReq.firstSetPwd(email,password);
//   //begin login
//   Result<User> loginRes= await authReq.loginWithEmailPwd(email, password);
//   print('loginRes: $loginRes');
// }