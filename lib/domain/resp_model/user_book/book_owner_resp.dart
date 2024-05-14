import '../../entity/book.dart';

class BookOwnerResp{
  List<Owner> owners;
  BookOwnerResp({
    required this.owners,
  });
  //fromJson
  factory BookOwnerResp.fromJson(Map<String, dynamic> json){
    List<dynamic> items=json['owner_list'];
    return BookOwnerResp(
      owners: items.map((e) => Owner.fromJson(e)).toList(),
    );
  }
}