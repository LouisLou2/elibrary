import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/widget/Image_card_with_info.dart';
import 'package:elibrary/presentation/widget/box_groov.dart';
import 'package:elibrary/presentation/widget/card_layout.dart';
import 'package:elibrary/presentation/widget/info_display/headline2.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/content_handler.dart';
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
  ContentProv cprov = ContentHandler.contentProv;
  @override
  void initState(){
    ContentHandler.initHomePageContent();
    super.initState();
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
                      onPressed: null,
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
                endIndent: 20,
              ),
              const SizedBox(height: UIParams.mediumGap,),
              Padding(
                padding: const EdgeInsets.only(left:14),
                child: Selector<ContentProv,int>(
                  selector: (_,prov)=> min(prov.recommendBooks.length,ContentHandler.home_reco_num),
                  builder: (_,number,__)=>BoxGroove(
                    title: Text(
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                      AppStrs.recomend,
                    ),
                    titleOnTap: ()=>Navigator.of(context).pushNamed('/section_list'),
                    widgets: List.generate(number,
                      (index) => CustomImageCard(
                        image: getCustomCachedImage(
                          url: cprov.recommendBooks[index].bookInfo.cover_l_url??'',
                          width: AppRepreConst.hugeBookW.w,
                          height: AppRepreConst.hugeBookW.w * AppRepreConst.bookCoverRatio,
                        ),
                        fontSize: 16,
                        text: cprov.recommendBooks[index].bookInfo.title,
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
                child: BoxGroove(
                  title: Text(
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                    AppStrs.recentlyViewed,
                  ),
                  titleOnTap: ()=>print('tt'),
                  widgets:List.generate(5,
                    (index) => ImageInfoBox(
                      image: Image.network(
                        'https://img1.baidu.com/it/u=3715471658,3948653362&fm=253&fmt=auto&app=120&f=JPEG?w=390&h=520',
                        fit: BoxFit.cover,
                        width: AppRepreConst.bigBookW.w,
                        height: AppRepreConst.bigBookW.w * AppRepreConst.bookCoverRatio,
                      ),
                      title: '愤怒的葡萄',
                      fontSize: 16,
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
            ],
          ),
        ),
      ),
    );
  }
}