
class UIConst{
  static String defImageHolder='assets/images/def_image_holder.svg';
}
class AppTransactionParam {
  // 推荐图书
  static const int recommendBookHomeNum = 6;
  static const int recommendBookPageSize = 10;

  // 获取拥有某本书的用户列表初始显示
  static const int userListDefSize = 10;
  // 获取拥有某本书的用户列表每次加载的数量
  static const int userListLoadSize = 10;

  // 借阅状态的文字描述
  static const Map<int,String> lendingStatusMap = {
    1: '已预约未取书',

    2: '已借阅未归还',
    3: '已归还',
    4: '逾期未归还',
    5: '已取消预约',
    6: '已超时未取书',
  };
  static bool goodStatus(int status){
    return status==2||status==3||status==4;
  }
  static int get reservingStatus => 1;
  static String getLendingStatusStr(int status){
    return lendingStatusMap[status]??'Unset';
  }
  static bool isReserved(int status){
    return status==1;
  }

  //record list
  static const int recordListPageSize = 10;
  static const int recordListDefSize = 30;

  // throttle time
  static const int throttleTime = 500;

  // category
  static const int cateBookDefSize = 10;
  static const int cateBookPageSize = 10;
}

class LibInfo{
  final int id;
  final String name;
  final String address;
  final String phone;
  final int openTime;
  final int closeTime;
  final String description;

  LibInfo({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.openTime,
    required this.closeTime,
    required this.description,
  });
}

class LibTranscationInfo{
  // 图书馆开关时间
  static const int libOpen=7;
  static const int libClose=22;
  // 图书馆最大借阅天数
  static const int maxKeepDays=15;

  static List<String> campusList = ['校本部', '新校区','南校区', '铁道校区', '湘雅校区',];
  static Map<int,String> campusMap = campusList.asMap();
  static String getCampusName(int id){
    return campusMap[id]??'Unset';
  }
  
  static Map<int,LibInfo> libInfoMap = {
    1: LibInfo(
      id: 1,
      name: '校本部图书馆',
      address: '湖南省长沙市岳麓区麓山南路932号',
      phone: '0731-88888888',
      openTime: libOpen,
      closeTime: libClose,
      description: '校本部图书馆是湖南大学的主要图书馆，藏书丰富，环境优美，服务周到。'
    ),
    2: LibInfo(
      id: 2,
      name: '新校区图书馆',
      address: '湖南省长沙市岳麓区麓山南路932号',
      phone: '0731-88888888',
      openTime: libOpen,
      closeTime: libClose,
      description: '南校区图书馆是湖南大学的分馆，藏书丰富，环境优美，服务周到。'
    ),
    3: LibInfo(
      id: 3,
      name: '铁道校区图书馆',
      address: '湖南省长沙市岳麓区麓山南路932号',
      phone: '0731-88888888',
      openTime: libOpen,
      closeTime: libClose,
      description: '湘雅图书馆是湖南大学医学院的图书馆，藏书丰富，环境优美，服务周到。'
    ),
    4: LibInfo(
      id: 4,
      name: '湘雅校区图书馆',
      address: '湖南省长沙市岳麓区麓山南路932号',
      phone: '0731-88888888',
      openTime: libOpen,
      closeTime: libClose,
      description: '铁道校区图书馆是湖南大学铁道学院的图书馆，藏书丰富，环境优美，服务周到。'
    ),
    5: LibInfo(
      id: 5,
      name: '南校区图书馆',
      address: '湖南省长沙市岳麓区麓山南路932号',
      phone: '0731-88888888',
      openTime: libOpen,
      closeTime: libClose,
      description: '其他校区图书馆是湖南大学的分馆，藏书丰富，环境优美，服务周到。'
    ),
  };
  // 第一个列表
  static List<String>libRules=[
    '请在预约时间内到达图书馆取书',
    '请取书时请出示您的学生证',
    '请在规定时间内归还图书',
    '在您未取书时，馆内藏书依然对所有读者开放，可能会出现书籍在取书时已被借走的情况，敬请谅解',
  ];
  static String getLibName(int id){
    return libInfoMap[id]?.name??'Unset';
  }
}