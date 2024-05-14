
import '../../../../config/config.dart';
// 这些route是需要持久化保存的，以应对后端api的变化,但是目前先不做这些了

class NetworkPathCollector {
  static const String host = Configs.HOST;// server host
  static const String restfulAPI = "/api/user"; // restful api
  static const String userApi = "$host$restfulAPI";// dio的baseUrl，客户端一切请求都是基于这个baseUrl的
  /*------------------分类-------------------*/
  static const book= "/book";
  static const userLend = "/user_lend";
  static const record = "/record";// 各种状态的记录，包括借书记录，预约记录等，get方法获取
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
  * /book/search
  * get 用于搜索书籍,返回的是一个搜索到的信息
  */
  static const String search = "$book/search";
  /*
  * /book/category
  * get: 用于获取某个分类下的书籍
   */
  static const String category_book = "$book/category";
  /*
   * book_detail
   * get: 用于获取书籍信息
   */
  static const String bookDetail = "$book/book_info";
  /*
   * book_shelf
   * get: 用于获取书架藏书 put: 用于添加藏书 delete: 用于删除藏书
   */
  static const String bookShelf = '$book/own_books';
  /*
   * reserve
   * post: 用于预约一本书籍
   */
  static const String reserve = '$book/reserve';
  /*
   * ownner
   * get: 用于获取藏书的所有者列表
   */
  static const String owner = '$book/lib_book';
  /*
  * /user_lend/user_list
  */
  static const String userList = '$userLend/user_list';
  /*
  * get: 由用户id获取用户信息
  */
  static const String userInfo = '/chat_users';
}