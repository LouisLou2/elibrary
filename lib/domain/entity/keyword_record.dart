import 'package:isar/isar.dart';
part 'keyword_record.g.dart';
@collection
class KeywordRecord{
  Id id = Isar.autoIncrement;
  @Index(unique: true,replace: true)
  String keyword;
  @Index()
  DateTime lastSearchTime;

  KeywordRecord({required this.keyword, required this.lastSearchTime});
}