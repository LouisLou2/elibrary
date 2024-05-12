
import '../../../../config/config.dart';
// 这些route是需要持久化保存的，以应对后端api的变化,但是目前先不做这些了

class NetworkPathCollector {
  static const String host = Configs.HOST;// server host
  static const String restfulAPI = "/api/user"; // restful api
  static const String userApi = "$host$restfulAPI";// dio的baseUrl，客户端一切请求都是基于这个baseUrl的
  /*------------------分类-------------------*/
  static const book= "/book";
  /* account
  * get: 用于登录，put: 用于更新信息
  */
  static const String account = "/account";
  /*get_email_code
  * post: 用于获取邮箱验证码
  */
  static const String requestEmailCode = '$account/get_email_code';
  /*
  *  recomendation_book
  *  get: 用于获取推荐书籍
  */
  static const String recoBook = "$book/reco_book";
  /*
   * book_detail
   * get: 用于获取书籍信息
   */
  static const String bookDetail = "$book/book_detail";
  /*
   * book_shelf
   * get: 用于获取书架藏书 put: 用于添加藏书 delete: 用于删除藏书
   */
  static const String bookShelf = '$book/own_books';
}