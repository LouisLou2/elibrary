import 'package:elibrary/presentation/widget/Image_card_with_info.dart';
import 'package:elibrary/presentation/widget/box_groov.dart';
import 'package:elibrary/presentation/widget/card_layout.dart';
import 'package:elibrary/presentation/widget/info_display/headline2.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';
import '../widget/custom_image_card.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key,});
  @override
  State<HomePage> createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>{
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
                      onPressed: ()=>Navigator.of(context).pushNamed('/book_detail'),
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
                child: BoxGroove(
                  title: Text(
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22,fontWeight: FontWeight.w500),
                    AppStrs.recomend,
                  ),
                  titleOnTap: ()=>print('tt'),
                  widgets:List.generate(5,
                     (index) => CustomImageCard(
                       image: Image.network(
                         'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                         fit: BoxFit.cover,
                         width: 200,
                         height: 300,
                       ),
                       text: '这是对图片的说明',
                       surfaceColor: Colors.white,
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
                        'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                        fit: BoxFit.cover,
                        width: 150,
                        height: 200,
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
                        'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                        fit: BoxFit.cover,
                        width: 360,
                        height: 150,
                      ),
                      title: '校本部图书馆读书会',
                      subTitle: '2024.5.1-2024.5.5',
                      fontSize: 18,
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