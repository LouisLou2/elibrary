import 'package:elibrary/constant/app_transaction_param.dart';

import 'book_info.dart';

/*Owner和Book类不与数据库以及服务端交互，只为了客户端编程的方便*/
class Owner{
  final int libId;
  final List<String> locations;
  const Owner({
    required this.libId,
    required this.locations,
  });
  String get libName => LibTranscationInfo.getLibName(libId);
  //fromJson
  factory Owner.fromJson(Map<String, dynamic> json){
    return Owner(
      libId: json['lib_id'],
      locations: List<String>.from(json['locations']),
    );
  }
}

class Book{
  BookInfo bookInfo;
  List<Owner>? owners;
  Book({
    required this.bookInfo,
    this.owners,
  });
  bool available(){
    return owners != null && owners!.isNotEmpty;
  }
  bool canReadOnline(){
    return bookInfo.ebook_url != null;
  }
}
/*对于一个isbn*/
// [
//   {
//     id: 1,
//     location:[
//       'AXIE 1045',
//       'FGTY 7890'
//     ]
//   },
//   {
//   id: 2,
//   location:[
//     'AXIE 1045',
//     'FGTY 7890'
//     ]
//   },
// ]