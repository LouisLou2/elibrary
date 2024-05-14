import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/constant/situation_enum.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/entity/book_shelf_ele.dart';
import 'package:elibrary/domain/resp_model/book_info/reserve_res_resp.dart';
import 'package:elibrary/domain/util_model/notification.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/user_book_repo.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/entity/book.dart';
import '../../domain/entity/record.dart';
import '../../domain/resp_model/user_lending/record_list_resp.dart';
import '../../respository/interface/bookinfo_repo.dart';
import '../../state_management/prov/record_prov.dart';
import '../../state_management/prov/reserve_prov.dart';
import '../../state_management/prov/book_shelf_prov.dart';
import '../requester/interface/userbook_requester.dart';

class UserBookHandler{

  static UserBookRep userBookRep = GetIt.I<UserBookRep>();
  static BookInfoRep bookInfoRep = GetIt.I<BookInfoRep>();
  static UserBookReq userBookReq = GetIt.I<UserBookReq>();

  static BookShelfProv bookshelfProv=ProvManager.bookshelfProv;
  static ReserveProv reserveProv=ProvManager.reserveProv;
  static RecordProv recordProv=ProvManager.recordProv;

  /*-------------------书架-----------------------*/
  // 初始化书架页面
  static void initBookShelfPage() async {
    // 获取book shelf内容
    Result<List<BookShelfEle>>shelfRes= await userBookRep.getBookShelf();
    if(shelfRes.resCode==ResCode.SUCCESS){
      bookshelfProv.setBookShelf(shelfRes.data??[]);
    }
    else{
      AppNotification notification=ResCode.getCorNotification(shelfRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }

  //返回信息是是否可以正常显示页面，如果是false, 应该换成加载中的动画，外加重试
  static Future<bool> initConfirmDialog({required String isbn}) async {
    Result<BookInfo>bookInfoRes= await bookInfoRep.getBookInfo(isbn);
    if(bookInfoRes.resCode==ResCode.SUCCESS){
      // 初始化确认书籍信息
      bookshelfProv.setConfirmBookInfo(bookInfoRes.data!);
      // 显示确认对话框
      return true;
    }
    else{
      AppNotification notification=ResCode.getCorNotification(bookInfoRes.resCode);
      ToastHelper.showToaster(notification);
      return false;
    }
  }
  // 返回的是: 是否成功，如果成功，就应该关闭dialog, 繁殖不做处理，用户看到提示，自然会重试
  static Future<bool> addBookToShelf({required BookInfo bookInfo,}) async{
    // 无论是否成功，都要关闭dialog
    Result<bool> addRes= await userBookReq.addBookToShelf(bookInfo.isbn);
    if(addRes.resCode==ResCode.SUCCESS){
      // 提示添加成功
      ToastHelper.showToasterWithParam(
          title: '添加成功',
          situaCode: SituationEnum.SUCCESS,
      );
      // 刷新书架
      bookshelfProv.addBookShelf(BookShelfEle.fromBookInfo(bookInfo));
      return true;
    }
    else{
      AppNotification notification=ResCode.getCorNotification(addRes.resCode);
      ToastHelper.showToaster(notification);
      return false;
    }
  }

  static Future<bool> rmBookFromShelf({required List<String> isbnList}) async{
    Result<bool> rmRes= await userBookReq.removeBookFromShelf(isbnList);
    if(rmRes.resCode==ResCode.SUCCESS){
      // 提示删除成功
      ToastHelper.showToasterWithParam(
          title: '删除成功',
          situaCode: SituationEnum.SUCCESS,
      );
      // 刷新书架
      bookshelfProv.removeBooksFromShelf(isbnList);
      return true;
    }
    else{
      AppNotification notification=ResCode.getCorNotification(rmRes.resCode);
      ToastHelper.showToaster(notification);
      return false;
    }
  }

  /*------------------预约-------------------------*/
  // 进入预约页面
  static void enterReservePage(Book book) async {
    reserveProv.setBook(book,notify: true);
    // reserveProv.enterPage(); 此方法会在页面的initState中调用，所以不需要在这里调用
    NavigationHelper.pushReplacementNamed(RouteCollector.reserve);
  }
  // 预约书籍
  static void reserveBook({required BookInfo bookInfo, required int libId, required DateTime dueTime}) async {
    Result<ReserveResultResp> reserveRes= await userBookReq.reserveBook(isbn: bookInfo.isbn, libId: libId, dueTime: dueTime);
    if(reserveRes.resCode==ResCode.SUCCESS){
      // 设置当前预约记录
      recordProv.setNowRecord_ReservedJustNow(
        reserverId: reserveRes.data!.reserveId,
        libId: libId,
        reserveTime: reserveRes.data!.reserveTime,
        dueTime: dueTime,
        bookInfo: bookInfo,
        notify: true,
      );
      // 提示预约成功
      ToastHelper.showToasterWithParam(
          title: '预约成功',
          situaCode: SituationEnum.SUCCESS,
      );
      // 进入预约记录页面
      NavigationHelper.pushReplacementNamed(RouteCollector.reservation_detail);
    }
    else{
      AppNotification notification=ResCode.getCorNotification(reserveRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }

  /*-----------------record列表------------------------*/
  static void enterRecordListPage() async {
    Result<List<LendingRecord>>recordListRes= await userBookRep.getRecordList(
      offset: 0,
      num: AppTransactionParam.recordListDefSize,
    );
    if(recordListRes.resCode==ResCode.SUCCESS){
      recordProv.setRecordList(recordListRes.data??[],notify: true);
      //直接先跳转会出range错误
      NavigationHelper.pushNamed(RouteCollector.record_list);
    }
    else{
      AppNotification notification=ResCode.getCorNotification(recordListRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  /*-----------------record详情-------------------------*/
  static void enterRecordDetailPage(LendingRecord record) async {
    Result<BookInfo>bookInfo = await bookInfoRep.getBookInfo(record.isbn);
    if(bookInfo.resCode==ResCode.SUCCESS){
      recordProv.setNowRecord(
        BookRecord(
          libId: record.libId,
          dueTime: record.deadline,
          reserveTime: record.reserveTime,
          status: record.status,
          bookInfo: bookInfo.data!,
          reserveId: record.reserveId,
        ),
        notify: false,
      );
      // 根据status判断进入哪个页面
      if(record.status==AppTransactionParam.reservingStatus){
        NavigationHelper.pushNamed(RouteCollector.reservation_detail);
      } else{
        NavigationHelper.pushNamed(RouteCollector.other_record_detail);
      }
    }
    else{
      AppNotification notification=ResCode.getCorNotification(bookInfo.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}