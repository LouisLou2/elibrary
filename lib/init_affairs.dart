import 'package:elibrary/config/test_device.dart';
import 'package:elibrary/datasource/db/interface/bookinfo_db_ds.dart';
import 'package:elibrary/datasource/db/interface/history_record_db_ds.dart';
import 'package:elibrary/datasource/db/interface/message_db_ds.dart';
import 'package:elibrary/datasource/db/interface/state_db_ds.dart';
import 'package:elibrary/datasource/network/implement/user_lend_net_ds_imple.dart';
import 'package:elibrary/datasource/network/implement/userbook_net_ds_imple.dart';
import 'package:elibrary/datasource/network/interface/bookinfo_net_ds.dart';
import 'package:elibrary/datasource/network/interface/userbook_net_ds.dart';
import 'package:elibrary/respository/implement/bookinfo_repo_imple.dart';
import 'package:elibrary/respository/implement/history_record_rep_imple.dart';
import 'package:elibrary/respository/implement/message_repo_imple.dart';
import 'package:elibrary/respository/implement/state_repo_imple.dart';
import 'package:elibrary/respository/implement/user_book_repo_imple.dart';
import 'package:elibrary/respository/implement/user_lend_repo_imple.dart';
import 'package:elibrary/respository/interface/bookinfo_repo.dart';
import 'package:elibrary/respository/interface/history_record_repo.dart';
import 'package:elibrary/respository/interface/message_repo.dart';
import 'package:elibrary/respository/interface/state_repo.dart';
import 'package:elibrary/respository/interface/user_book_repo.dart';
import 'package:elibrary/respository/interface/user_lend_repo.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/usecase/path_manager.dart';
import 'package:elibrary/usecase/requester/implement/auth_requester_imple.dart';
import 'package:elibrary/usecase/requester/implement/chat_messenger_imple.dart';
import 'package:elibrary/usecase/requester/implement/user_book_requester.dart';
import 'package:elibrary/usecase/requester/interface/auth_requester.dart';
import 'package:elibrary/usecase/requester/interface/chat_messenger.dart';
import 'package:elibrary/usecase/requester/interface/userbook_requester.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import 'datasource/db/implement/bookinfo_db_ds_imple.dart';
import 'datasource/db/implement/history_record_db_ds_imple.dart';
import 'datasource/db/implement/message_db_ds_imple.dart';
import 'datasource/db/implement/state_db_ds_imple.dart';
import 'datasource/db/manage/db_manager.dart';
import 'datasource/network/implement/bookinfo_net_ds_imple.dart';
import 'datasource/network/interface/user_lend_net_ds.dart';
import 'datasource/network/manage/network_config.dart';
import 'datasource/ws/websocket_manager.dart';

Future<void> initMustBeforeRunApp() async {
  TestDeviceCollection.init();// 初始化测试设备尺寸，无前置依赖
  ProvManager.init();// 初始化ProviderList，无前置依赖
  WidgetsFlutterBinding.ensureInitialized();
  await PathManager.init();// 初始化路径，前置依赖: WidgetsFlutterBinding.ensureInitialized();
  await DBManager.init();// 初始化数据库，前置依赖: PathManager
  await initInjection();// 初始化依赖注入，有一部分依赖前置: DBManager，networkManager
  ProvManager.initUserState();// 初始化用户状态，前置依赖: DBManager，initInjection
}

void initWhenWidgetBuilding(BuildContext context){
  final Brightness brightness = MediaQuery.platformBrightnessOf(context);
  ProvManager.themeProv.init(brightness==Brightness.light?ThemeMode.light:ThemeMode.dark);
  generalUIInit(brightness);
}

Future<void> initAsync() async {
  NetworkConfig.init();// 初始化网络配置，前置依赖: ProvManager.init();
  wsInit();// 初始化WebSocket，前置依赖: ProvManager.initUserState
}

void generalUIInit(Brightness b){
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: b,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: b==Brightness.light?Brightness.dark:Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  EasyLoading.instance.indicatorType=EasyLoadingIndicatorType.fadingCircle;
}
// lazy and not lazy
Future<void> initInjection() async {
  /*------------------datasource--------------------*/
  // db
  GetIt.I.registerLazySingleton<StateDbDs>(()=>StateDbDsImple());
  GetIt.I.registerLazySingleton<BookInfoDbDs>(()=>BookInfoDbDsImple());
  GetIt.I.registerLazySingleton<MessageDbDs>(()=>MessageDbDsImple());
  GetIt.I.registerLazySingleton<HistoryRecordDbDs>(()=>HistoryRecordDBDSImple());
  // network
  GetIt.I.registerLazySingleton<BookInfoNetDs>(()=>BookInfoNetDsImple());
  GetIt.I.registerLazySingleton<UserBookNetDS>(() => UserBookNetDSImple());
  GetIt.I.registerLazySingleton<UserLendNetDs>(()=>UserLendNetDsImple());
  /*------------------respository--------------------*/
  GetIt.I.registerSingleton<StateRep>(StateRepImple());
  GetIt.I.registerSingleton<BookInfoRep>(BookInfoRepImple());
  GetIt.I.registerSingleton<UserBookRep>(UserBookRepImple());
  GetIt.I.registerLazySingleton<UserLendRep>(()=>UserLendRepImple());
  GetIt.I.registerLazySingleton<MessageRep>(()=>MessageRepImple());
  GetIt.I.registerLazySingleton<HistoryRecordRep>(()=>HistoryRecordRepImple());
  /*------------------usecase--------------------*/
  //requester
  GetIt.I.registerLazySingleton<AuthReq>(()=>AuthRequesterImple());
  GetIt.I.registerLazySingleton<UserBookReq>(() => UserBookReqImplent());
  GetIt.I.registerLazySingleton<ChatMessenger>(()=>ChatMessengerImple());
}

Future<void> wsInit() async {
  if(!ProvManager.userProv.isLogin)return;
  WebSocketManager.initInstance(
    token: ProvManager.userProv.token,
    onMessage: (message){
      GetIt.I<ChatMessenger>().receiveMessage(message);
    },
  );
}