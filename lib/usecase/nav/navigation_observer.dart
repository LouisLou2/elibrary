import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:flutter/material.dart';

class MyObserver extends NavigatorObserver {
  final ContentProv contentProv = ProvManager.contentProv;
  final List<String> pages = [];

  @override
  void didPush(Route route, Route? previousRoute) {
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    //if(newRoute == null) return;
    if(oldRoute?.settings.name == RouteCollector.book_detail){
      contentProv.popBookStack();
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    // i don't know what to do
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if(route.settings.name == RouteCollector.book_detail){
      contentProv.popBookStack();
    }
  }
}