import 'package:elibrary/constant/rescode.dart';
import 'package:elibrary/domain/entity/book_info.dart';

import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/helper/global_exception_helpe.dart';
import 'package:isar/isar.dart';

import '../interface/bookinfo_db_da.dart';
import '../manage/db_manager.dart';

class BookInfoDbDsImple implements BookInfoDbDs {

  final db = DBManager.db;

  @override
  Result<BookInfo> getBookInfo(String isbn){
    try{
      final bookInfo = db.bookInfos.where().isbnEqualTo(isbn).findFirstSync();
      if(bookInfo==null){
        return Result.abnormal(ResCode.DB_DATA_NOT_EXIST);
      }
      return Result.success(bookInfo);
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo<BookInfo>(e);
    }
  }

  @override
  Future<Result<bool>> saveBookInfo(BookInfo bookInfo) {
    return db.writeTxn(() async {
      try{
        final info = await db.bookInfos.where().isbnEqualTo(bookInfo.isbn).findFirst();
        if(info!=null){
          bookInfo.id=info.id;
        }
        db.bookInfos.put(bookInfo);
        return Result.success(true);
      } catch(e){
        return GlobalExceptionHelper.getErrorResInfo<bool>(e);
      }
    });
  }
}