import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:flutter/material.dart';

class NavigationHelper{
  const NavigationHelper._();
  // 此类不应该被实例化
  static final _key = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get key =>_key;

  static Future<T?>? pushNamed<T extends Object>(String routeName,{Object? arguments,}){
    return _key.currentState?.pushNamed<T?>(
      routeName,
      arguments: arguments,
    );
  }
  static Future<T?>? pushReplacementNamed<T extends Object>(String routeName,{Object? arguments,}){
    return _key.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }
  static void pop<T extends Object?>([T? result]){
    return _key.currentState?.pop(result);
  }
  static Future<Object?>? popAllAndPushNamed(String routeName){
    return _key.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
  /*---------自定义页面跳转封装----------*/
  static Future<Object?>? popAllAndBoard(){
    return popAllAndPushNamed(RouteCollector.onboarding,);
  }
  // 一些封装好的方法
  static Future<Object?>? popAllAndAuth(){
    return popAllAndPushNamed(RouteCollector.auth_pages);
  }
  static Future<Object?>? popAllAndMainPage(){
    return popAllAndPushNamed(RouteCollector.main_page);
  }
  static Future<Object?>? popAllAndFirstSetPwd(){
    return popAllAndPushNamed(RouteCollector.set_pwd);
  }
}