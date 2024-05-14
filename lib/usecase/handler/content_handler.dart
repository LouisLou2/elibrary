import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/constant/book_const.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/bookinfo_repo.dart';
import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/entity/book.dart';
import '../../domain/entity/book_info.dart';
import '../../state_management/prov/category_prov.dart';
import '../../state_management/prov_manager.dart';

class ContentHandler{

  static ContentProv contentProv = ProvManager.contentProv;
  static CategoryProv categoryProv = ProvManager.categoryProv;
  static BookInfoRep bookInfoRep= GetIt.I<BookInfoRep>();

  // 初始化首页内容
  static Future<void> initHomePageContent() async {
    // 获取推荐书籍
    final recoRes = await bookInfoRep.getRecoBooks(
      offset: 0,
      num: AppTransactionParam.recommendBookHomeNum,
    );
    if(recoRes.resCode==ResCode.SUCCESS){
      contentProv.setRecoBooksWithBookInfo(
        recoRes.data!,
        notify: true,
      );
    }else{
      final notification = ResCode.getCorNotification(recoRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  // 初始化book详情内容
  static Future<void> browseDetail(BookInfo info)async{
    // bookInfo已经有了，现在需要获取owner信息
    Book book=Book(bookInfo: info);
    Result<List<Owner>> ownerRes=await bookInfoRep.getBookOwners(info.isbn);
    if(ownerRes.resCode==ResCode.SUCCESS){
      book.owners=ownerRes.data!;
      contentProv.setNowBook(book);
      // 进入详情页面
      NavigationHelper.pushNamed(RouteCollector.book_detail);
    }else{
      final notification = ResCode.getCorNotification(ownerRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  // 进入每个分类的详情页
  static Future<void> enterCategoryDetail(int cate1)async{
    categoryProv.setNowCategory1(cate1,notify: false);
    categoryProv.setNowCategory2(BookConst.defCate2ForCate1(cate1),notify: false);// 默认的子类别
    // 开始获取书籍数据TODO
    NavigationHelper.pushNamed(RouteCollector.category_book);
    // loading
    EasyLoading.show(status: 'loading...');
    // 获取书籍数据
    Result<List<BookInfo>> bookRes=await bookInfoRep.getBooksByCategory(
      category1: cate1,
      category2: categoryProv.nowCategory2,
      offset: 0,
      num: AppTransactionParam.cateBookDefSize,
    );
    EasyLoading.dismiss();
    if(bookRes.resCode==ResCode.SUCCESS){
      categoryProv.setCate12Books(bookRes.data!,notify: true);
    }else{
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  // 更换二级分类
  static Future<void> changeCategory2({required int newCate2})async{
    categoryProv.setNowCategory2(newCate2,notify: false);
    //清空之前的数据
    categoryProv.clearCate12Books(notify: true);
    // 开始获取书籍数据TODO
    // loading
    EasyLoading.show(status: 'loading...');
    // 获取书籍数据
    Result<List<BookInfo>> bookRes=await bookInfoRep.getBooksByCategory(
      category1: categoryProv.nowCategory1,
      category2: newCate2,
      offset: 0,
      num: AppTransactionParam.cateBookDefSize,
    );
    EasyLoading.dismiss();
    if(bookRes.resCode==ResCode.SUCCESS){
      categoryProv.setCate12Books(bookRes.data!,notify: true);
    }else{
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}