import 'package:flutter/material.dart';

import '../../presentation/page/error_page.dart';

class RouteGenerator {

  static MaterialPageRoute<void> getRoute({
    required Widget widget,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  })=>MaterialPageRoute<void>(
    builder: (context) => widget,
    settings: settings,
    fullscreenDialog: fullscreenDialog,
  );

  // 用于根据给定的RouteSettings生成路由。当尝试导航到未定义的命名路由时，将调用此函数来动态生成路由。
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /*simpleRoutes中都是注册在路由表中的，不会触发这个方法，只有路由到simpleRoutes表中的路由地址才会触发这个方法
    * assert (RouteCollector.specialRoutes.contains(settings.name));
    * 对于那些需要特殊处理的路由，我们在这里进行处理*/
    return getRoute(widget: const ErrorPage(), settings: settings);
    // switch (settings.name) {
    //   case RouteCollector.explanation:
    //     String imgPath = settings.arguments as String;
    //     return getRoute(widget: ExplanationPage(imgPath: imgPath,), settings: settings);
    //   case RouteCollector.file_preview:
    //     String path = settings.arguments as String;
    //     return getRoute(widget: FilePreviewPage(path: path,), settings: settings);
    //   default:
    //     return getRoute(widget: const ErrorPage(), settings: settings);
    // }
  }
}