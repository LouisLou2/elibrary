import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../constant/app_properties.dart';

/*此类没必要使用抽象-接口风格了，直接全部使用了静态方法*/
class PathManager{
  static bool _inited = false;//是否已经初始化

  /*
  *全平台都有的临时目录(非必要不用)---用于存放临时文件
  */
  static late Directory _tempDir;

  /*
  * 全平台都有的应用支持目录---数据库等
  */
  static late Directory _appSupportDir;

  /*
  * 全平台都有的文档目录，存储用户数据，例如用户头像，用户笔记等
  * */
  static late Directory _docDir;

  /*
  * 全平台都有的缓存目录， 存储缓存文件，例如图片缓存，电子书缓存等
  * */
  static late Directory _cacheDir;

  static String bookCover= 'book_cover';
  static String eBook= 'ebook';
  static String db= 'db';

  static late Directory bookCoverDir;//存储书籍封面的父级目录
  static late Directory bookCoverLDir;//存储书籍封面的L图
  static late Directory bookCoverMDir;//存储书籍封面的M图
  static late Directory bookCoverSDir;//存储书籍封面的S图

  static late Directory eBookDir;//存储笔记文件
  static late Directory dbDir;//存储数据库文件


  static _initPath() async{
    // 获取这四个目录之间没有先后依赖关系
    _appSupportDir = await getApplicationSupportDirectory();
    _tempDir = await getTemporaryDirectory();
    _docDir = await getApplicationDocumentsDirectory();
    _cacheDir = await getTemporaryDirectory();
  }

  static _initDir() async{
    dbDir = Directory('${_appSupportDir.path}/${AppProperties.appName}/$db');
    eBookDir = Directory('${_docDir.path}/${AppProperties.appName}/$eBook');
    bookCoverDir = Directory('${_cacheDir.path}/${AppProperties.appName}/$bookCover');
    bookCoverLDir = Directory('${bookCoverDir.path}/l');
    bookCoverMDir = Directory('${bookCoverDir.path}/m');
    bookCoverSDir = Directory('${bookCoverDir.path}/s');
    //不存在的话，就递归创建
    if(!await dbDir.exists()){
      await dbDir.create(recursive: true);
    }
    if(!await eBookDir.exists()){
      await eBookDir.create(recursive: true);
    }
    if(!await bookCoverDir.exists()){
      await bookCoverDir.create(recursive: true);
    }
    if(!await bookCoverLDir.exists()){
      await bookCoverLDir.create(recursive: true);
    }
    if(!await bookCoverMDir.exists()){
      await bookCoverMDir.create(recursive: true);
    }
    if(!await bookCoverSDir.exists()){
      await bookCoverSDir.create(recursive: true);
    }
  }

  static init() async {
    if(_inited){
      return;
    }
    await _initPath();
    await _initDir();
    _inited = true;
  }
}