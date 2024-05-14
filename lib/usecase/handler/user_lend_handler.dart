import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/datasource/network/interface/user_lend_net_ds.dart';
import 'package:elibrary/domain/entity/book_info.dart';
import 'package:elibrary/domain/util_model/notification.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/state_management/prov/user_lending_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/entity/book_shelf_ele.dart';
import '../../domain/entity/simple_user.dart';
import '../../respository/interface/user_book_repo.dart';
import '../../respository/interface/user_lend_repo.dart';

class UserLendHandler{

  static UserLendRep userLendRep= GetIt.I<UserLendRep>();
  static UserBookRep userBookRep= GetIt.I<UserBookRep>();
  static UserLendingProv userLendingProv= ProvManager.userLendingProv;

  // 此方法是不断获取用户借阅列表的方法，一直往后获取并添加
  static Future<void> updateUserListAsUsual({required String isbn,}) async {
    Result<List<SimpleUser>> res = await userLendRep.getBookOwners(
        isbn: isbn, offset: userLendingProv.userListOffset, num: AppTransactionParam.userListLoadSize);
    if (res.resCode == ResCode.SUCCESS) {
      userLendingProv.addUserList(res.data!,notify: true);
    } else{
      AppNotification notification = ResCode.getCorNotification(res.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  // 被上一个页面调用，进入用户列表页面
  static Future<void> enterUserListPage(BookInfo bookInfo) async {
    userLendingProv.setNowBookInfo(bookInfo,notify: false);
    // 先跳转，再获取用户列表
    NavigationHelper.pushNamed(RouteCollector.user_list);
    Result<List<SimpleUser>> res = await userLendRep.getBookOwners(isbn: bookInfo.isbn,offset: 0, num: AppTransactionParam.userListDefSize);
    if(res.resCode==ResCode.SUCCESS){
      userLendingProv.setUserList(res.data!,notify: true);// false表示不通知
    }
    else{
      AppNotification notification = ResCode.getCorNotification(res.resCode);
      ToastHelper.showToaster(notification);
    }
  }

  /*-----------------为了用户进入浏览用户信息的页面--------------------------*/
  static Future<void> enterBrowseUserPage(SimpleUser suer) async {
    // 先设置用户信息
    userLendingProv.setNowUser(suer,notify: false);
    // 先跳转，再获取用户书架信息
    NavigationHelper.pushNamed(RouteCollector.browse_user);
    // 获取用户书架信息
    Result<List<BookShelfEle>> res = await userBookRep.getBookShelf(userId: suer.userId);// TODO: 错误方法
    if(res.resCode==ResCode.SUCCESS){
      userLendingProv.setNowUserShelf(res.data!,notify: true);
    }else{
      AppNotification notification = ResCode.getCorNotification(res.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}