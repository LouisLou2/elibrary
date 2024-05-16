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

import '../../constant/data_enum.dart';
import '../../constant/rescode.dart';
import '../../domain/entity/book.dart';
import '../../domain/entity/book_info.dart';
import '../../respository/interface/history_record_repo.dart';
import '../../state_management/prov/category_prov.dart';
import '../../state_management/prov_manager.dart';

class ContentHandler{

  static ContentProv contentProv = ProvManager.contentProv;
  static CategoryProv categoryProv = ProvManager.categoryProv;
  static BookInfoRep bookInfoRep= GetIt.I<BookInfoRep>();
  static HistoryRecordRep historyRecordRep= GetIt.I<HistoryRecordRep>();

  /*------------------首页内容加载------------------------------*/
  // 初始化首页内容
  static Future<void> initHomePageContent() async {
    // 最近浏览书籍
    final recentRes = await historyRecordRep.getRecentBrowsedBooks(
      offset: 0,
      num: AppTransactionParam.browsedRecentDefSize,
    );
    if(recentRes.resCode==ResCode.SUCCESS){
      contentProv.setRecentBrowsedBooks(
        recentRes.data!,
        notify: false,
      );
    }else{
      final notification = ResCode.getCorNotification(recentRes.resCode);
      ToastHelper.showToaster(notification);
    }
    // 获取推荐书籍
    // 先用本地数据库中的数据渲染页面，不至于推荐专栏一片空白
    final recoRes = await bookInfoRep.getRecoBooks(
      offset: 0,
      num: AppTransactionParam.recommendBookHomeNum,
      dataSource: DataSource.DB_FIRST,
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
    // 网络
    //EasyLoading.show(status: 'loading...');
    final netRecoRes = await bookInfoRep.getRecoBooks(
      offset: 0,
      num: AppTransactionParam.recommendBookHomeNum,
      dataSource: DataSource.ONLY_NET,
    );
    //EasyLoading.dismiss();
    if(netRecoRes.resCode==ResCode.SUCCESS){
      contentProv.setRecoBooksWithBookInfo(
        netRecoRes.data!,
        notify: true,
      );
    }else{
      final notification = ResCode.getCorNotification(netRecoRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  /*-------------------------书籍详情-----------------------------*/
  // 初始化book详情内容
  static Future<void> browseDetail(BookInfo info)async{
    EasyLoading.show(status: 'loading...');
    // bookInfo已经有了，现在需要获取owner信息
    Book book=Book(bookInfo: info);
    Result<List<Owner>> ownerRes=await bookInfoRep.getBookOwners(info.isbn);
    EasyLoading.dismiss();
    if(ownerRes.resCode==ResCode.SUCCESS){
      book.owners = ownerRes.data!;
      contentProv.setNowBook(book);
      // 进入详情页面
      NavigationHelper.pushNamed(RouteCollector.book_detail);
      // 到这一步才能算用户真的“浏览过了”
      historyRecordRep.saveRecentBrowsedBook(info);
    }else{
      final notification = ResCode.getCorNotification(ownerRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  /*--------------------分类图书浏览-----------------------------*/
  // 进入每个分类的详情页
  static Future<void> enterCategoryDetail({required int cate1, int? cate2})async{
    cate2 ??= BookConst.defCate2ForCate1(cate1);
    categoryProv.clearCate12Books(notify: false);
    categoryProv.setNowCategory1(cate1,notify: false);
    categoryProv.setNowCategory2(cate2,notify: false);// 默认的子类别
    // 开始获取书籍数据TODO
    NavigationHelper.pushNamed(RouteCollector.category_book);
    // loading
    EasyLoading.show(status: 'loading...');
    // 获取书籍数据
    Result<List<BookInfo>> bookRes=await bookInfoRep.getBooksByCategory(
      category1: cate1,
      category2: cate2,
      offset: 0,
      num: AppTransactionParam.cateBookDefSize,
    );
    EasyLoading.dismiss();
    if(bookRes.resCode==ResCode.SUCCESS){
      categoryProv.setCate12Books(
        list: bookRes.data!,
        status: DataEnum.SUCCESS,
        notify: true,
      );
    }else if(bookRes.resCode==ResCode.DATA_NOT_NEW){
      categoryProv.setCate12Books(
        list: bookRes.data!,
        status: DataEnum.OLD,
        notify: true,
      );
    }else{
      // 此情况基本不会触发,因为即使是网络错误，也会有缓存，即使缓存为空，也只是空数据，也会被DATA_NOT_NEW截断
      categoryProv.setDataEnum(DataEnum.ERROR,notify: true);
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  // 更换二级分类
  static Future<void> changeCategory2({required int newCate2})async{
    if(newCate2 == categoryProv.nowCategory2) return;
    categoryProv.clearCate12Books(notify: false);
    categoryProv.setNowCategory2(newCate2,notify: false);// 默认的子类别
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
      categoryProv.setCate12Books(
        list: bookRes.data!,
        status: DataEnum.SUCCESS,
        notify: true,
      );
    }else if(bookRes.resCode==ResCode.DATA_NOT_NEW){
      categoryProv.setCate12Books(
        list: bookRes.data!,
        status: DataEnum.OLD,
        notify: true,
      );
    }else{
      categoryProv.setDataEnum(DataEnum.ERROR,notify: true);
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  // 自动加载更多,只允许刚才的加载也是SUCCESS的
  static Future<void> autoLoadMoreCate12Books() async{
    if(categoryProv.dataEnum!=DataEnum.SUCCESS) return;
    // loadmore只能从网络获取
    // loading
    EasyLoading.show(status: 'loading...');
    // 获取书籍数据
    Result<List<BookInfo>> bookRes=await bookInfoRep.getBooksByCategory(
      category1: categoryProv.nowCategory1,
      category2: categoryProv.nowCategory2,
      offset: categoryProv.cate12Books.length,
      num: AppTransactionParam.cateBookDefSize,
      onlyNet: true,
    );
    EasyLoading.dismiss();
    if(bookRes.resCode==ResCode.SUCCESS){
      categoryProv.addCate12Books(
        list: bookRes.data!,
        status: DataEnum.SUCCESS,
        notify: true,
      );
    }else{
      categoryProv.setDataEnum(DataEnum.ERROR,notify: true);
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  // 加载更多
  static Future<void> loadMoreCate12Books() async{
    if(categoryProv.dataEnum!=DataEnum.SUCCESS||categoryProv.dataEnum!=DataEnum.ERROR) return;
    // loadmore只能从网络获取
    // loading
    EasyLoading.show(status: 'loading...');
    // 获取书籍数据
    Result<List<BookInfo>> bookRes=await bookInfoRep.getBooksByCategory(
      category1: categoryProv.nowCategory1,
      category2: categoryProv.nowCategory2,
      offset: categoryProv.cate12Books.length,
      num: AppTransactionParam.cateBookDefSize,
      onlyNet: true,
    );
    EasyLoading.dismiss();
    if(bookRes.resCode==ResCode.SUCCESS){
      categoryProv.addCate12Books(
        list: bookRes.data!,
        status: DataEnum.SUCCESS,
        notify: true,
      );
    }else{
      categoryProv.setDataEnum(DataEnum.ERROR,notify: true);
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  static Future<void> reqToReloadPage() async{
    if(categoryProv.dataEnum != DataEnum.OLD) return;
    // loading
    EasyLoading.show(status: 'loading...');
    // 获取书籍数据
    Result<List<BookInfo>> bookRes=await bookInfoRep.getBooksByCategory(
      category1: categoryProv.nowCategory1,
      category2: categoryProv.nowCategory2,
      offset: 0,
      num: AppTransactionParam.cateBookDefSize,
      onlyNet: true,// 注意,只能从网络获取，既然只能从网络获取，那么就不需要考虑是否是DATA_NOT_NEW
    );
    EasyLoading.dismiss();
    if(bookRes.resCode==ResCode.SUCCESS){
      categoryProv.setCate12Books(
        list: bookRes.data!,
        status: DataEnum.SUCCESS,
        notify: true,
      );
    }else{
      // 仍然是OLD
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  /*-------------------排行榜-------------------------------*/
  static Future<void> initTrendingBooks() async{
    // loading
    // 获取书籍数据
    Result<List<BookInfo>> bookRes=await bookInfoRep.getRecoBooks(
      offset: 301,
      num: 10,
      dataSource: DataSource.ONLY_NET,
    );
    if(bookRes.resCode==ResCode.SUCCESS){
      contentProv.setTrendingBooks(
        bookRes.data!,
        notify: true,
      );
    }else{
      final notification = ResCode.getCorNotification(bookRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}