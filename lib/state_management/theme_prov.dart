import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProv extends ChangeNotifier{
  ThemeMode mode;
  ThemeProv():mode=ThemeMode.light;
  void init(ThemeMode m){
    mode=m;
    mode=ThemeMode.dark;
  }
  void changeMode(ThemeMode m){
    mode=m;
    notifyListeners();
  }
}