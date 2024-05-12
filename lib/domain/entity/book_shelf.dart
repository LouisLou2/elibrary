import 'package:isar/isar.dart';
part 'book_shelf.g.dart';

@collection
class BookShelf{
Id id=Isar.autoIncrement;
  @Index(unique: true)
  int userId;
  List<String> isbnList;
  DateTime lastModifyTime;

  BookShelf({
    required this.userId,
    required this.isbnList,
    required this.lastModifyTime,
  });
}