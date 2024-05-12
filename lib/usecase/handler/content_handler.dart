import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/bookinfo_repo.dart';
import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../state_management/prov_manager.dart';

class ContentHandler{

  static const int home_reco_num=6;// 首页推荐滑槽的固定数量
  static const int home_reco_limit=0;// 推荐的每次获取数量

  static ContentProv contentProv = ProvManager.contentProv;
  static BookInfoRep bookInfoRep= GetIt.I<BookInfoRep>();

  static initHomePageContent() async {
    // 获取推荐书籍
    final recoRes = await bookInfoRep.getRecoBooks(
      offset: contentProv.recommendBooks.length,
      num: home_reco_num,
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
}