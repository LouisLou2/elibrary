import 'package:elibrary/state_management/theme_prov.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProvManager{
  static late ThemeProv themeProv;

  static void init(){
    themeProv=ThemeProv();
  }

  static List<SingleChildWidget> widgets(){
    return [
      ChangeNotifierProvider.value(value: themeProv),
    ];
  }
}