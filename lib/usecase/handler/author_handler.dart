import 'package:elibrary/domain/resp_model/author_resp.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:get_it/get_it.dart';

import '../../constant/app_transaction_param.dart';
import '../../constant/data_enum.dart';
import '../../constant/rescode.dart';
import '../../domain/entity/author.dart';
import '../../domain/util_model/res_info.dart';
import '../../presentation/helper/toast_helper.dart';
import '../../respository/interface/bookinfo_repo.dart';
import '../../state_management/prov/author_prov.dart';
import '../../state_management/prov_manager.dart';
import '../nav/route_collector.dart';

class AuthorHanler{
  static BookInfoRep bookInfoRep= GetIt.I<BookInfoRep>();
  static final AuthorProv authorProv = ProvManager.authorProv;

  static Future<void> enterAuthorDetail(int authorId,{int withBookNum=AppTransactionParam.authorBookDefSize}) async{
    // 先跳转到作者详情页
    authorProv.setAuthorId(authorId);
    authorProv.setWholePageState(DataEnum.LOADING,notify: false);
    NavigationHelper.pushNamed(RouteCollector.author_detail);
    // 获取作者信息
    Result<AuthorResp> resp=await bookInfoRep.getAuthorInfo(
      authorId: authorId,
      withBookNum: withBookNum,
    );
    if(resp.resCode==ResCode.SUCCESS){
      // 设置作者信息
      authorProv.setFullData(
        author: Author(
          name: resp.data!.name,
          desc: resp.data!.desc,
          authorId: resp.data!.authorId,
        ),
        list: resp.data!.books,
        notify: true,
      );
    }else{
      authorProv.setWholePageState(DataEnum.ERROR,notify: true);
      final notification = ResCode.getCorNotification(resp.resCode);
      ToastHelper.showToaster(notification);
    }
  }

  static Future<void> reloadAuthorDetail(int authorId,{int withBookNum=AppTransactionParam.authorBookDefSize}) async{
    authorProv.setWholePageState(DataEnum.LOADING,notify: true);
    Result<AuthorResp> resp=await bookInfoRep.getAuthorInfo(
      authorId: authorId,
      withBookNum: withBookNum,
    );
    if(resp.resCode==ResCode.SUCCESS){
      // 设置作者信息
      authorProv.setFullData(
        author: Author(
          name: resp.data!.name,
          desc: resp.data!.desc,
          authorId: resp.data!.authorId,
        ),
        list: resp.data!.books,
        notify: true,
      );
    }else{
      authorProv.setWholePageState(DataEnum.ERROR,notify: true);
      final notification = ResCode.getCorNotification(resp.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}