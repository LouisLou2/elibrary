import 'package:elibrary/presentation/page/main_tabs.dart';
import 'package:flutter/material.dart';

import '../../presentation/page/auth/auth_pages.dart';
import '../../presentation/page/auth/set_pwd_page.dart';
import '../../presentation/page/onboarding_page.dart';

class RouteCollector {
  static const String onboarding = '/onboarding';
  static const String main_page = '/main';

  static const String auth_pages = '/account/auth';
  static const String set_pwd = '/account/set_pwd';

  static const Set<String> simpleRoutes = {
    onboarding,
    auth_pages,
    main_page,
    set_pwd,
  };

  // specialRoutes中的路由不会在路由表中注册，而是在RouteGenerator中动态生成,因为这些路由需要用户满足某种条件才能跳转
  static const Set<String> specialRoutes = {

  };
  static Map<String, WidgetBuilder> simpleRouteMap = {
    onboarding: (context) => const OnBoardingPage(),
    auth_pages: (context) => const AuthPages(),
    main_page: (context) => const MainTabsPage(),
    set_pwd: (context) => const SetPwdPage(),
  };
  // {
  // '/book_detail':(context)=>const BookDetail(),
  // '/reservation_detail': (context) => const ReservationDetail(),
  // '/record':(context)=>const RecordPage(),
  // '/booking':(context)=>const BookingPage(),
  // '/search':(context)=>const SearchPage(),
  // '/user_list': (context) => const UserListPage(),
  // '/browse_user': (context) => const BrowseUserPage(),
  // '/sign_in': (context) => const SignInPage(),
  // '/chat_page': (context) => const ChatPage(),
  // '/chat_session': (context) => const ChatSessionPage(),
  // '/section_list': (context) => const SectionListPage(),
  // },
}