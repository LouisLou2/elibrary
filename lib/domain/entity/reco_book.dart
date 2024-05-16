import 'package:isar/isar.dart';

import 'book_info.dart';

part 'reco_book.g.dart';

@collection
class RecoBook{
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

  DateTime recoTime;

  RecoBook({
    required this.isbn,
    required this.title,
    required this.authorIds,
    required this.authorNames,
    required this.publisher,
    required this.pubDate,
    required this.wordCount,
    required this.category1,
    required this.category2,
    required this.cover_l_url,
    required this.cover_s_url,
    required this.recoTime,
    this.originalTitle,
    this.desc,
    this.tags,
    this.cover_m_url,
    this.ebook_url,
  });

  factory RecoBook.fromJson(Map<String, dynamic> map){
    return RecoBook(
      isbn: map['isbn'],
      title: map['title'],
      authorIds: List<int>.from(map['authorIds']),
      authorNames: List<String>.from(map['authorNames']),
      publisher: map['publisher'],
      pubDate: DateTime.parse(map['pubDate']),
      wordCount: map['wordCount'],
      category1: map['category1'],
      category2: map['category2'],
      cover_l_url: map['cover_l_url'],
      cover_s_url: map['cover_s_url'],
      recoTime: DateTime.parse(map['recoTime']),
      originalTitle: map['originalTitle'],
      desc: map['desc'],
      tags: map['tags']!=null?List<String>.from(map['tags']):null,
      cover_m_url: map['cover_m_url'],
      ebook_url: map['ebook_url'],
    );
  }

  factory RecoBook.fromBookInfo(BookInfo info){
    return RecoBook(
      isbn: info.isbn,
      title: info.title,
      authorIds: info.authorIds,
      authorNames: info.authorNames,
      publisher: info.publisher,
      pubDate: info.pubDate,
      wordCount: info.wordCount,
      category1: info.category1,
      category2: info.category2,
      cover_l_url: info.cover_l_url,
      cover_s_url: info.cover_s_url,
      recoTime: DateTime.now(),
      originalTitle: info.originalTitle,
      desc: info.desc,
      tags: info.tags,
      cover_m_url: info.cover_m_url,
      ebook_url: info.ebook_url,
    );
  }

  BookInfo toBookInfo(){
    return BookInfo(
      isbn: isbn,
      title: title,
      authorIds: authorIds,
      authorNames: authorNames,
      publisher: publisher,
      pubDate: pubDate,
      wordCount: wordCount,
      category1: category1,
      category2: category2,
      cover_l_url: cover_l_url,
      cover_s_url: cover_s_url,
      originalTitle: originalTitle,
      desc: desc,
      tags: tags,
      cover_m_url: cover_m_url,
      ebook_url: ebook_url,
    );
  }
}