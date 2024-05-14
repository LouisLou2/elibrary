import '../../entity/author.dart';
import '../../entity/book_info.dart';

class SearchResp{
  List<Author> authors;
  List<String> publishers;
  List<BookInfo> books;

  SearchResp({
    required this.authors,
    required this.publishers,
    required this.books,
  });

  factory SearchResp.fromJson(Map<String, dynamic> json){
List<Author> authors = [];
    List<String> publishers = [];
    List<BookInfo> books = [];
    if(json['authors'] != null){
      json['authors'].forEach((v) {
        authors.add(Author.fromJson(v));
      });
    }
    if(json['publishers'] != null){
      json['publishers'].forEach((v) {
        publishers.add(v);
      });
    }
    if(json['books'] != null){
      json['books'].forEach((v) {
        books.add(BookInfo.fromJson(v));
      });
    }
    return SearchResp(
      authors: authors,
      publishers: publishers,
      books: books,
    );
  }
}