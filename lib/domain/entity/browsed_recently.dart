import 'package:isar/isar.dart';
part 'browsed_recently.g.dart';

@collection
class BrowsedRecently{
  Id id = Isar.autoIncrement;
  @Index()
  DateTime browseTime;
  @Index(unique: true,replace: true)
  String isbn;

  BrowsedRecently({required this.browseTime, required this.isbn});
}