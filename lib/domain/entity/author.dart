import 'package:isar/isar.dart';
part 'author.g.dart';

@collection
class Author{
  Id id=Isar.autoIncrement;
  @Index(unique: true)
  int authorId;
  String name;
  String? desc;
  Author({
    required this.authorId,
    required this.name,
    this.desc,
  });
}
