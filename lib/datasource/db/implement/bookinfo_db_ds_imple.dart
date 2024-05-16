import 'package:elibrary/constant/rescode.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/entity/cate_books.dart';
import 'package:elibrary/domain/entity/reco_book.dart';

import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/helper/global_exception_helpe.dart';
import 'package:isar/isar.dart';

import '../interface/bookinfo_db_ds.dart';
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
        db.bookInfos.put(bookInfo);
        return Result.success(true);
      } catch(e){
        return GlobalExceptionHelper.getErrorResInfo<bool>(e);
      }
    });
  }

  @override
  Future<void> updateCateBookInfo({required int category1, required int category2, required List<BookInfo> bookInfos}) {
    List<String> isbns = bookInfos.map((e) => e.isbn).toList();
    db.writeTxn(
      ()async {
        // 直接更新cateBooks，不用删除
        db.cateBooks.put(CateBooks(category1: category1, category2: category2, isbns: isbns));
        // 更新bookInfos
        db.bookInfos.putAll(bookInfos);
      }
    );
    return Future.value(Result.success(true));
  }

  @override
  Future<Result<List<BookInfo>>> getDefCategoryBooks({required int category1, required int category2}) async{
    try{
      final cateBook = await db.cateBooks.where().category1Category2EqualTo(category1, category2).findFirst();
      List<String> isbns = cateBook?.isbns??[];
      List<BookInfo> books=[];
      for (var isbn in isbns) {
        final bookInfo = await db.bookInfos.where().isbnEqualTo(isbn).findFirst();
        if(bookInfo!=null){
          books.add(bookInfo);
        }
      }
      return Result.success(books);
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Result<List<BookInfo>>> getRecoBooks({required int num}) async{
    try{
      List<RecoBook> res = await db.recoBooks.where().sortByRecoTimeDesc().limit(num).findAll();
      List<BookInfo> books= List<BookInfo>.from(res.map((e) => e.toBookInfo()));
      return Result.success(books);
    } catch(e){
      return GlobalExceptionHelper.getErrorResInfo(e);
    }
  }

  @override
  Future<Result<bool>> saveAfewRecoBooks(List<BookInfo> books) {
    return db.writeTxn(() async {
      // 反向存储
      List<RecoBook> recoBooks = [];
      for(int i=books.length-1; i>=0; --i){
        recoBooks.add(RecoBook.fromBookInfo(books[i]));
      }
      db.recoBooks.putAll(recoBooks);
      return Result.success(true);
    });
  }
}