import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/bookinfo_repo.dart';
import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:elibrary/usecase/nav/route_generator.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/entity/book.dart';
import '../../domain/entity/book_info.dart';
import '../../state_management/prov_manager.dart';

class ContentHandler{

  static ContentProv contentProv = ProvManager.contentProv;
  static BookInfoRep bookInfoRep= GetIt.I<BookInfoRep>();

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
}