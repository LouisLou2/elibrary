import 'package:isar/isar.dart';
part 'cate_books.g.dart';
@collection
class CateBooks{
  Id id =Isar.autoIncrement;
  @Index(composite: [CompositeIndex('category2')],unique: true, replace: true)
  int category1;
  int category2;
  List<String> isbns;

  CateBooks({required this.category1,required this.category2,required this.isbns});

  factory CateBooks.fromJson(Map<String,dynamic> json){
    return CateBooks(
      category1: json['category1'],
      category2: json['category2'],
      isbns: json['isbns'].cast<String>()
    );
  }
}