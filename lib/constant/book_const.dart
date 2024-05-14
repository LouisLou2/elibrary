class CateChild{
  int begin;// category2List的开始位置
  int end;// category2List的结束位置
  CateChild(this.begin,this.end);
}


class BookConst{

  static String bookCoverAssetsDir='assets/images/book_cover';
  static String category1CoverDir='$bookCoverAssetsDir/category1';
  static List<String> category1CoverAssets=[
    '$category1CoverDir/literature.jpg',
    '$category1CoverDir/history.jpg',
    '$category1CoverDir/science.jpg',
    '$category1CoverDir/social_science.jpg',
    '$category1CoverDir/philosophy.jpg',
    '$category1CoverDir/art.jpg',
    '$category1CoverDir/natural_science.jpg',
    '$category1CoverDir/computer_science.jpg',
    '$category1CoverDir/health_life.jpg',
    '$category1CoverDir/technology_engineering.jpg',
  ];
  static List<String> category1List = [
    '文学', '历史', '科学', '社会科学', '哲学', '艺术', '自然科学', '计算机科学', '健康与生活', '技术与工程'
  ];
  static List<String> category2List = [
    '小说', '诗歌', '戏剧', '散文', '文集', '世界历史', '国别历史', '历史传记', '历史文化', '历史地理',
    '物理学', '化学', '生物学', '天文学', '地球科学', '政治学', '经济学', '社会学', '心理学', '人类学',
    '伦理学', '形而上学', '逻辑学', '美学', '政治哲学', '绘画', '摄影', '雕塑', '音乐', '舞蹈',
    '地理', '生态学', '气象学', '地质学', '生物科学', '编程', '算法', '数据库', '人工智能', '网络安全',
    '健康养生', '饮食营养', '心理健康', '亲子育儿', '旅行与探险', '机械工程', '电气工程', '建筑工程', '材料科学', '化学工程'
  ];
  static List<CateChild> cateChildList = [
    CateChild(0,4),
    CateChild(5,9),
    CateChild(10,14),
    CateChild(15,19),
    CateChild(20,24),
    CateChild(25,29),
    CateChild(30,34),
    CateChild(35,39),
    CateChild(40,44),
    CateChild(45,49),
  ];

  static List<int> defaultMostPopularCategory1 = [0,1,2,3,4,5,];

  // 创建 Map<int, String>
  static Map<int, String> mapCategories = category1List.asMap();
  static Map<int, String> mapSubCategories = category2List.asMap();
  static Map<int,String> category1CoverMap = category1CoverAssets.asMap();

  static String getCategory1Name(int id) => mapCategories[id]??'Unset';
  static String getCategory2Name(int id) => mapSubCategories[id]??'Unset';
  static String getCate1Cover(int id) => category1CoverMap[id]??'Unset';
  static int defCate2ForCate1(int cate1) => cateChildList[cate1].begin;
}