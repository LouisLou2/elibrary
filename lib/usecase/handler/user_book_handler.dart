import 'package:elibrary/domain/entity/book_shelf_ele.dart';
import 'package:elibrary/domain/util_model/notification.dart';
import 'package:elibrary/domain/util_model/res_info.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/user_book_repo.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../state_management/prov/user_book_prov.dart';

class UserBookHandler{

  static UserBookRep userBookRep = GetIt.I<UserBookRep>();
  static UserBookProv userBookProv=ProvManager.userBookProv;

  static void initBookShelfPage() async {
    // 获取book shelf内容
    Result<List<BookShelfEle>>shelfRes= await userBookRep.getBookShelf();
    if(shelfRes.resCode==ResCode.SUCCESS){
      userBookProv.setBookShelf(shelfRes.data??[]);
    }
    else{
      AppNotification notification=ResCode.getCorNotification(shelfRes.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}