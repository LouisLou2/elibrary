import 'package:isar/isar.dart';
part 'book_cache_info.g.dart';

@collection
class BookCacheInfo{
  Id id=Isar.autoIncrement;
  @Index(unique: true)
  String isbn;
  String? cover_l_path;
  String? cover_m_path;
  String? cover_s_path;
  String? ebook_path;

  BookCacheInfo({
    required this.isbn,
    this.cover_l_path,
    this.cover_m_path,
    this.cover_s_path,
    this.ebook_path,
  });
}