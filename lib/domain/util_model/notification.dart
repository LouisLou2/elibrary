import 'package:elibrary/constant/situation_enum.dart';

class AppNotification {
  final int situaCode;
  final String title;
  final String? desc;
  const AppNotification({
    required this.situaCode,
    required this.title,
    this.desc,
  });
}