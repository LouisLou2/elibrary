import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/presentation/widget/gradient_image_card.dart';
import 'package:elibrary/presentation/widget/section_window.dart';
import 'package:elibrary/presentation/widget/text_action_widget.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_strings.dart';
import '../widget/custom_image_card.dart';
import '../widget/image_tile.dart';
import '../widget/info_display/headline2.dart';
import '../../extension/core_extension.dart';

class BrowseBookPage extends StatefulWidget {
  const BrowseBookPage({super.key});

  @override
  State<BrowseBookPage> createState() => _BrowseBookPageState();
}

class _BrowseBookPageState extends State<BrowseBookPage> {

  late SearchController _searchController;
  late FocusNode _focusNode;

  @override
  void initState() {
    _searchController = SearchController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      onPressed: ()=>Navigator.of(context).pushNamed('/reservation_detail'),
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
                  title: AppStrs.browse,
                  size: 37,
                ),
              ),
              const SizedBox(height: UIParams.mediumGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 0),
                child: Hero(
                  tag: 'browsePage:searchBar',
                  child: SearchBar(
                    controller: _searchController,
                    autoFocus: false,
                    focusNode: _focusNode,
                    hintText: '搜索书名, 作者, 出版社',
                    hintStyle: Theme.of(context).textTheme.titleSmall!=null? MaterialStatePropertyAll<TextStyle>(
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ):null,
                    side: MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                    backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary.withOpacity(0.18)),
                    surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    elevation: const MaterialStatePropertyAll<double>(3.0),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(UIParams.defBorderR),
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).pushNamed('/search');
                      _focusNode.unfocus();
                      print('@@@@@@@@@@@@onTap');
                    },
                    onChanged: (_){
                      print('@@@@@@@@@@@@onChanged');
                    },
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Search by scanning barcode',
                        child: IconButton(
                          icon: const Icon(Icons.document_scanner_outlined), onPressed: () {  },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: UIParams.mediumGap),
              SectionWindow(
                title:  AppStrs.hotKind,
                fontSize: 22,
                titleOnTap: (){},
                actionOnTap: (){},
                actionText: AppStrs.viewAll,
                widgets: List.generate(6,
                      (index) => GradientImageCard(
                    image: Image.network(
                      'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                      fit: BoxFit.cover,
                      width: 200,
                      height: 300,
                    ),
                    text: '分类$index',
                    onTap: (){},
                  ),
                ),
              ),
              const SizedBox(height: UIParams.mediumGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                child: TextActionWidget(
                  text: SpecTextWidget.mediumTitle(text: AppStrs.trending, context: context),
                  size: 22,
                  onTap: (){},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 0),
                child:Column(
                  children: ListExtension.separate(
                    6,
                    (index)=>GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: ()=>Navigator.of(context).pushNamed('/book_detail'),
                      child: ImageTile(
                        title: 'Dart Apprentice',
                        subTitle: 'Leo Dion, Peter Friese',
                        thirdTitle: 'Programming',
                        subtitleColor: Theme.of(context).colorScheme.primary,
                        image: Image.network(
                          'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                          fit: BoxFit.cover,
                          width: AppRepreConst.mediumBookW.w,
                          height: AppRepreConst.mediumBookW.w * AppRepreConst.bookCoverRatio,
                        ),
                        actionWidget: null,
                        fontSize: 20,
                      ),
                    ),
                    (index)=>LayoutBuilder(
                      builder: (BuildContext context,BoxConstraints constraints){
                        return Divider(
                          height: UIParams.smallGap.h,
                          indent: constraints.maxWidth * 0.3,
                          endIndent: 20,
                        );
                      },
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