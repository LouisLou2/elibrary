import 'dart:math';
import 'package:card_swiper/card_swiper.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/presentation/widget/Image_card_with_info.dart';
import 'package:elibrary/presentation/widget/box_groov.dart';
import 'package:elibrary/presentation/widget/card_layout.dart';
import 'package:elibrary/presentation/widget/info_display/headline2.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/content_handler.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../../state_management/prov/content_prov.dart';
import '../../widget/custom_image_card.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key,});
  @override
  State<HomePage> createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>{
  List<String> swipe_urls=[
    'https://m.media-amazon.com/images/I/61PDCJRd2mS._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/51B7z49UKQL._AC_UF1000,1000_QL80_.jpg',
    'https://m.media-amazon.com/images/I/71fnqwR0eSL._AC_UF894,1000_QL80_.jpg',
  ];

  final ContentProv _cprov = ContentHandler.contentProv;

  @override
  void initState(){
    super.initState();
    ContentHandler.initHomePageContent();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    child: IconButton(
                      onPressed: (){
                        NavigationHelper.pushNamed(RouteCollector.notification_page);
                      },
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: HeadLine2(
                  title: AppStrs.read,
                  size: 37,
                ),
              ),
              const Divider(
                height: 8,
                thickness: 1.5,
                indent: 20,
              ),
              const SizedBox(height: UIParams.mediumGap,),
              Padding(
                padding: const EdgeInsets.only(left:14),
                child: Selector<ContentProv,String>(
                  selector: (_,prov)=> prov.recoBookKey,
                  builder: (_,strKey,__)=>BoxGroove(
                    title: Text(
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                      AppStrs.recomend,
                    ),
                    titleOnTap: ()=>Navigator.of(context).pushNamed('/section_list'),
                    widgets: List.generate(_cprov.recommendBooks.length,
                      (index) => CustomImageCard(
                        surfaceColor: Colors.white,
                        onTap: ()=> ContentHandler.browseDetail(_cprov.recommendBooks[index].bookInfo),
                        image: Hero(
                          tag: _cprov.recommendBooks[index].bookInfo.isbn,
                          child:getCustomCachedImage(
                            url: _cprov.recommendBooks[index].bookInfo.cover_l_url??'',
                            width: AppRepreConst.hugeBookW.w,
                            height: AppRepreConst.hugeBookW.w * AppRepreConst.bookCoverRatio,
                          ),
                        ),
                        fontSize: 16,
                        text: _cprov.recommendBooks[index].bookInfo.title,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left:14),
                child: Selector<ContentProv,String>(
                  selector: (_,prov)=>prov.recentBrowsedBookKey,
                  builder: (_,strKey,__)=>BoxGroove(
                    title: Text(
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                      AppStrs.recentlyViewed,
                    ),
                    titleOnTap: ()=> print('tt'),
                    widgets:List.generate(_cprov.recentBrowsedBooks.length,
                      (index) => ImageInfoBox(
                        image: getCustomCachedImage(
                          url: _cprov.recentBrowsedBooks[index].cover_l_url??'',
                          width: AppRepreConst.bigBookW.w,
                          height: AppRepreConst.bigBookW.w * AppRepreConst.bookCoverRatio,
                        ),
                        title: FormatTool.trimText(_cprov.recentBrowsedBooks[index].title,maxLength: 15),
                        fontSize: 16,
                        onTap: (){
                          ContentHandler.browseDetail(_cprov.recentBrowsedBooks[index]);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left:10),
                child: BoxGroove(
                  title: Text(
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                    AppStrs.activity,
                  ),
                  titleOnTap: ()=>print('tt'),
                  widgets:List.generate(5,
                    (index) => CardLayout(
                      image: Image.network(
                        'https://img1.baidu.com/it/u=3715471658,3948653362&fm=253&fmt=auto&app=120&f=JPEG?w=390&h=520',
                        fit: BoxFit.cover,
                        width: AppRepreConst.grandCardW.w,
                        height: AppRepreConst.grandCardW.w * AppRepreConst.cardRatio,
                      ),
                      title: '校本部图书馆读书会',
                      subTitle: '2024.5.1-2024.5.5',
                      fontSize: 18.sp,
                      action: FilledButton(
                        onPressed: ()=>print('查看详情'),
                        child: const Text(
                          '查看详情',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                child: GestureDetector(
                  onTap: null,
                  child: Row(
                    children: [
                      SpecTextWidget.mediumTitle(
                        text: '看点新鲜',
                        context: context,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 380,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: getCustomCachedImage(
                        url: swipe_urls[index],
                      ),
                    );
                  },
                  itemCount: 3,
                  itemWidth: 290.0,
                  layout: SwiperLayout.STACK,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}