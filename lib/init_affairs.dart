import 'dart:ui';

import 'package:elibrary/state_management/prov_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void initMustBeforeRunApp(){
  ProvManager.init();
}
void initWhenWidgetBuilding(BuildContext context){
  final Brightness brightness = MediaQuery.platformBrightnessOf(context);
  ProvManager.themeProv.init(brightness==Brightness.light?ThemeMode.light:ThemeMode.dark);
  generalUIInit(brightness);
  print("initWhenWidgetBuilding");
}

Future<void> initAsync() async{
  WidgetsFlutterBinding.ensureInitialized();
}

void generalUIInit(Brightness b){
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: b,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: b==Brightness.light?Brightness.dark:Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}