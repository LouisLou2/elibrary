import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/domain/resp_model/book_info/search_resp.dart';
import 'package:elibrary/domain/util_model/notification.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/respository/interface/bookinfo_repo.dart';
import 'package:elibrary/respository/interface/history_record_repo.dart';
import 'package:elibrary/state_management/prov/search_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import '../../constant/rescode.dart';
import '../../domain/util_model/res_info.dart';
import '../nav/navigation_helper.dart';
import '../nav/route_collector.dart';

class SearchHandler {
  static final BookInfoRep _bookInfoRep = GetIt.I.get<BookInfoRep>();
  static final HistoryRecordRep historyRecord = GetIt.I.get<HistoryRecordRep>();
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
  static void onSubmitted(String keyword,{bool replaceBarText=false}) async {
    if(replaceBarText){
      _searchProv.toggleSearchedKeyword(keyword);
    }
    // 保存搜索关键词
    addSearchKeyword(keyword);
    // 搜索
    search(keyword);
  }
  static void enterSearchPage() async{
    // 主要就是关键字搜索历史
    // 先将搜索框清空
    _searchProv.toggleSearchedKeyword('',notify: false);
    // 查询历史
    Result<List<String>> history = await historyRecord.getSearchKeywords(num: AppTransactionParam.keywordMaxNum);
    if(history.resCode==ResCode.SUCCESS){
      _searchProv.setKeywords(history.data!,notify: false);
      // 跳转
      NavigationHelper.pushNamed(RouteCollector.search);
    }else{
      AppNotification notification = ResCode.getCorNotification(history.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  static void addSearchKeyword(String keyword) async{
    _searchProv.addSearchKeyword(keyword);
    Result<bool> result = await historyRecord.saveSearchKeyword(keyword);
    if(result.resCode!=ResCode.SUCCESS){
      AppNotification notification = ResCode.getCorNotification(result.resCode);
      ToastHelper.showToaster(notification);
    }
  }
  static void clearSearchKeywords() async{
    _searchProv.setKeywords([],notify: true);
    Result<bool> result = await historyRecord.clearSearchKeywords();
    if(result.resCode!=ResCode.SUCCESS){
      AppNotification notification = ResCode.getCorNotification(result.resCode);
      ToastHelper.showToaster(notification);
    }
  }
}