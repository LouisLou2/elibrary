import 'package:elibrary/domain/entity/author.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/usecase/path_manager.dart';
import 'package:isar/isar.dart';

import '../../../../domain/entity/book_cache_info.dart';
import '../../../../domain/entity/book_shelf.dart';
import '../../../../domain/entity/mark.dart';
import '../../../../domain/entity/user.dart';

/*静态*/
class DBManager{
  static late final Isar _db;
  static Isar get db=>_db;

  static init() async {
    _db= await Isar.open(
      [
        MarkSchema,
        UserSchema,

        BookShelfSchema,

        BookInfoSchema,
        AuthorSchema,
        BookCacheInfoSchema,
      ],
      directory: PathManager.dbDir.path,
      inspector: true,
    );
  }
}