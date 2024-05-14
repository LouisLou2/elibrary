import 'package:elibrary/domain/entity/book_info.dart';

class BookShelfEle{
  final String isbn;
  final String title;
  final String cover_url;
  const BookShelfEle({
    required this.isbn,
    required this.title,
    required this.cover_url
  });
  factory BookShelfEle.fromJson(Map<String,dynamic>map){
     return BookShelfEle(
       isbn: map['isbn'],
       title: map['title'],
       cover_url: map['cover_l_url'],
     );
  }
  factory BookShelfEle.fromBookInfo(BookInfo bookInfo){
    return BookShelfEle(
      isbn: bookInfo.isbn,
      title: bookInfo.title,
      cover_url: bookInfo.cover_l_url,
    );
  }
}