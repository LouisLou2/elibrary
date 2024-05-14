import 'package:elibrary/domain/resp_model/book_info/search_resp.dart';
import 'package:elibrary/domain/util_model/notification.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/bookinfo_repo.dart';
import 'package:elibrary/state_management/prov/search_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/util_model/res_info.dart';

class SearchHandler {
  static final BookInfoRep _bookInfoRep = GetIt.I.get<BookInfoRep>();
  static final SearchProv _searchProv = ProvManager.searchProv;

  static void search(String keyword) async {
    if(keyword.isEmpty){
      _searchProv.toggleSearchedKeyword(keyword);
      return;
    }
    // search logic
    EasyLoading.show(status: 'loading...');
    // 发请求
    Result<SearchResp> result = await _bookInfoRep.search(keyword: keyword);
    EasyLoading.dismiss();
    if (result.resCode == ResCode.SUCCESS) {
      // 成功
      // 写入数据，刷新页面
      _searchProv.setSearchResult(
        authors: result.data!.authors,
        books: result.data!.books,
        publishers: result.data!.publishers,
      );
      //先改变状态
      _searchProv.toggleSearchedKeyword(keyword);
    } else {
      AppNotification notification = ResCode.getCorNotification(result.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}