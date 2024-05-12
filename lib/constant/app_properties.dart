class Feature{
  final String title;
  final String desc;

  Feature({required this.title, required this.desc});
}

class AppProperties{
  static const String appName = 'elibrary';
  static const String appVersion = '1.0.0';
  static List<Feature> features = [
    Feature(
      title: '海量图书',
      desc: '探索中南大学图书馆庞大的图书馆藏，涵盖从文学经典到科学研究的各个学科。',
    ),
    Feature(
      title: '一键借阅',
      desc: '您可以轻松选择所在分馆并快速借阅图书。只需几次点击，即可完成借书手续。',
    ),
    Feature(
      title: '个性推荐',
      desc: '通过分析您的阅读历史和偏好，为您定制书单，帮助您发现图书馆中那些隐藏的宝藏。',
    ),
  ];
}