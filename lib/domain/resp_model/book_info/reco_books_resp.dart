import 'dart:convert';

import '../../entity/book_info.dart';

class RecoResp {
  late List<BookInfo> bookInfos;

  RecoResp({
    required this.bookInfos,
  });

  factory RecoResp.fromJson(Map<String,dynamic> map){
    List<dynamic>items = jsonDecode(map['books_info']);
    List<BookInfo> bookInfos=List<BookInfo>.from(items.map((e) => BookInfo.fromJson(e)));
    return RecoResp(
      bookInfos: bookInfos,
    );
  }
}