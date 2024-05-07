import 'package:elibrary/state_management/theme_prov.dart';
import 'package:elibrary/state_management/veri_code_prov.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_prov.dart';

class ProvManager{
  static late ThemeProv themeProv;
  static late VeriCodeProv veriCodeProv;
  static late AuthProv authProv;

  static void init(){
    themeProv=ThemeProv();
    veriCodeProv=VeriCodeProv();
    authProv=AuthProv();
  }

  static List<SingleChildWidget> widgets(){
    return [
      ChangeNotifierProvider.value(value: themeProv),
      ChangeNotifierProvider.value(value: veriCodeProv),
      ChangeNotifierProvider.value(value: authProv),
    ];
  }
}