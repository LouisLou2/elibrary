import 'package:isar/isar.dart';
part 'mark.g.dart';

@collection
class Mark{
  Id id=Isar.autoIncrement;

  @Index(unique: true,replace: true)
  int? lastUserId;

  Mark({this.lastUserId});
}