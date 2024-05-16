import 'package:isar/isar.dart';

import '../../constant/book_const.dart';
part 'book_info.g.dart';

// isar嵌套对象的字段必须都可空，这不是一个好的设计，所以暂时放弃这个嵌套
// class SimpleAuthorInfo{
//   int author_id;
//   String name;
//   SimpleAuthorInfo({
//     required this.author_id,
//     required this.name,
//   });
//   factory SimpleAuthorInfo.fromJson(Map<String, dynamic> map){
//     return SimpleAuthorInfo(
//       author_id: map['author_id'],
//       name: map['name'],
//     );
//   }
// }

@collection
class BookInfo{
  Id id=Isar.autoIncrement;

  @Index(unique: true,replace: true)
  String isbn;

  String title;
  String? originalTitle;
  List<int> authorIds;
  List<String> authorNames;
  String publisher;

  @Index()
  DateTime pubDate;

  @Index()
  int wordCount;
  String? desc;

  @Index()
  int category1;

  @Index()
  int category2;

  List<String>? tags;
  String cover_l_url;
  String? cover_m_url;
  String cover_s_url;
  String? ebook_url;
  // 在这里不打算加book的Owner, 这些信息是更改较为频繁的，不适合做客户端缓存

  BookInfo({
    required this.isbn,
    required this.title,
    required this.authorIds,
    required this.authorNames,
    required this.publisher,
    required this.pubDate,
    required this.wordCount,
    required this.category1,
    required this.category2,
    this.originalTitle,
    this.desc,
    this.tags,
    required this.cover_l_url,
    this.cover_m_url,
    required this.cover_s_url,
    this.ebook_url,
  });

  factory BookInfo.fromJson(Map<String, dynamic> map){
    print('ok');
    return BookInfo(
      isbn: map['isbn'],
      title: map['title'],
      originalTitle: map['original_title'],
      publisher: map['publisher'],
      authorIds: List<int>.from(map['author_ids']),
      authorNames: List<String>.from(map['author_names']),
      pubDate: DateTime.now(),
      wordCount: map['word_count'],
      desc: map['desc'],
      category1: map['category1'],
      category2: map['category2'],
      tags: map['tags']!=null?List<String>.from(map['tags']):null,
      cover_l_url: map['cover_l_url'],
      cover_m_url: map['cover_m_url'],
      cover_s_url: map['cover_s_url'],
      ebook_url: map['ebook_url'],
    );
  }
  String get authorNamesStr=>authorNames.join(', ');
  String get cate1Str=>BookConst.getCategory1Name(category1);
}
