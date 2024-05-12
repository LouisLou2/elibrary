import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/state_management/prov/theme_prov.dart';
import 'package:elibrary/state_management/prov/user_book_prov.dart';
import 'package:elibrary/state_management/prov/user_prov.dart';
import 'package:elibrary/state_management/prov/veri_code_prov.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../respository/interface/state_repo.dart';
import 'prov/auth_prov.dart';

class ProvManager{

  static StateRep stateRep= GetIt.I<StateRep>();// GetIt.I is a callable object

  static late ThemeProv themeProv;

  static late ContentProv contentProv;

  static late UserProv userProv;

  static late VeriCodeProv veriCodeProv;
  static late AuthProv authProv;
  static late UserBookProv userBookProv;

  static List<SingleChildWidget> widgets(){
    return [
      ChangeNotifierProvider.value(value: themeProv),

      ChangeNotifierProvider.value(value: contentProv),

      ChangeNotifierProvider.value(value: userProv),

      ChangeNotifierProvider.value(value: veriCodeProv),
      ChangeNotifierProvider.value(value: authProv),
      ChangeNotifierProvider.value(value: userBookProv),
    ];
  }

  static void init(){
    themeProv=ThemeProv();

    contentProv=ContentProv();

    userProv=UserProv();

    veriCodeProv=VeriCodeProv();
    authProv=AuthProv();
    userBookProv=UserBookProv();
  }

  static initUserState(){
    userProv.setUser(stateRep.getLastLoginUser());
  }
}