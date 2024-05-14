import 'package:elibrary/presentation/page/browse/search_page.dart';
import 'package:elibrary/presentation/page/content/ebook_preview.dart';
import 'package:elibrary/presentation/page/main_tabs.dart';
import 'package:elibrary/presentation/page/record/non_reservation_detail.dart';
import 'package:elibrary/presentation/page/reservation/booking_page.dart';
import 'package:elibrary/presentation/page/reservation/reservation_detail.dart';
import 'package:elibrary/presentation/page/user_lending/browse_user_page.dart';
import 'package:flutter/material.dart';

import '../../presentation/page/auth/auth_pages.dart';
import '../../presentation/page/auth/set_pwd_page.dart';
import '../../presentation/page/content/book_detail.dart';
import '../../presentation/page/onboarding_page.dart';
import '../../presentation/page/record/record_page.dart';
import '../../presentation/page/user_lending/chat_page.dart';
import '../../presentation/page/user_lending/chat_session.dart';
import '../../presentation/page/user_lending/user_list.dart';

class RouteCollector {
  static const String onboarding = '/onboarding';
  static const String main_page = '/main';

  static const String auth_pages = '/account/auth';
  static const String set_pwd = '/account/set_pwd';

  static const String book_detail = '/book_detail';
  static const String reserve = '/reserve';
  static const String reservation_detail = '/reservation_detail';
  static const String other_record_detail = '/other_record_detail';

  static const String user_list = '/user_lend/user_list';
  static const String browse_user = '/user_lend/browse_user';

  static const String chat_page = '/chat/chat_page';
  static const String chat_session = '/chat/chat_session';

  static const String record_list = '/record_list';

  static const String ebook_preview = '/ebook_preview';

  static const String search = '/search';

  static const Set<String> simpleRoutes = {
    onboarding,
    main_page,

    auth_pages,
    set_pwd,

    book_detail,
    reserve,
    reservation_detail,

    user_list,
    browse_user,

    chat_page,
    chat_session,

    record_list,

    ebook_preview,

    search,
  };

  // specialRoutes中的路由不会在路由表中注册，而是在RouteGenerator中动态生成,因为这些路由需要用户满足某种条件才能跳转
  static const Set<String> specialRoutes = {

  };
  static Map<String, WidgetBuilder> simpleRouteMap = {
    onboarding: (context) => const OnBoardingPage(),
    main_page: (context) => const MainTabsPage(),

    auth_pages: (context) => const AuthPages(),
    set_pwd: (context) => const SetPwdPage(),

    book_detail: (context) => const BookDetail(),
    reserve: (context) => const BookingPage(),
    reservation_detail: (context) => const ReservationDetail(),
    other_record_detail: (context) => const NonReservationDetail(),

    user_list: (context) => const UserListPage(),
    browse_user: (context) => const BrowseUserPage(),

    chat_page: (context) => const ChatPage(),
    chat_session: (context) => const ChatSessionPage(),

    record_list: (context) => const RecordPage(),

    ebook_preview: (context)=>const EbookPreviewPage(),

    search: (context) => const SearchPage(),

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