import 'package:elibrary/domain/req_model/user_book/reserve_param.dart';
import 'package:elibrary/state_management/prov/chat_prov.dart';
import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/state_management/prov/record_prov.dart';
import 'package:elibrary/state_management/prov/reserve_prov.dart';
import 'package:elibrary/state_management/prov/search_prov.dart';
import 'package:elibrary/state_management/prov/theme_prov.dart';
import 'package:elibrary/state_management/prov/book_shelf_prov.dart';
import 'package:elibrary/state_management/prov/user_lending_prov.dart';
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

  static late BookShelfProv bookshelfProv;
  static late ReserveProv reserveProv;
  static late RecordProv recordProv;

  static late UserLendingProv userLendingProv;
  static late ChatProv chatProv;

  static late SearchProv searchProv;

  static List<SingleChildWidget> widgets(){
    return [
      ChangeNotifierProvider.value(value: themeProv),

      ChangeNotifierProvider.value(value: contentProv),

      ChangeNotifierProvider.value(value: userProv),

      ChangeNotifierProvider.value(value: veriCodeProv),
      ChangeNotifierProvider.value(value: authProv),

      ChangeNotifierProvider.value(value: bookshelfProv),
      ChangeNotifierProvider.value(value: reserveProv),
      ChangeNotifierProvider.value(value: recordProv),

      ChangeNotifierProvider.value(value: userLendingProv),
      ChangeNotifierProvider.value(value: chatProv),

      ChangeNotifierProvider.value(value: searchProv),
    ];
  }

  static void init(){
    themeProv=ThemeProv();

    contentProv=ContentProv();

    userProv=UserProv();

    veriCodeProv=VeriCodeProv();
    authProv=AuthProv();

    bookshelfProv=BookShelfProv();
    reserveProv=ReserveProv();
    recordProv=RecordProv();

    userLendingProv=UserLendingProv();
    chatProv=ChatProv();

    searchProv=SearchProv();
  }

  static initUserState(){
    userProv.setUser(stateRep.getLastLoginUser());
  }
}