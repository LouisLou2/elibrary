import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/presentation/widget/gradient_image_card.dart';
import 'package:elibrary/presentation/widget/section_window.dart';
import 'package:elibrary/presentation/widget/text_action_widget.dart';
import 'package:elibrary/state_management/prov/category_prov.dart';
import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/content_handler.dart';
import 'package:elibrary/usecase/handler/search_handler.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:elibrary/usecase/nav/route_collector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../widget/image_tile.dart';
import '../../widget/info_display/headline2.dart';
import '../../../extension/core_extension.dart';

class BrowseBookPage extends StatefulWidget {
  const BrowseBookPage({super.key});

  @override
  State<BrowseBookPage> createState() => _BrowseBookPageState();
}

class _BrowseBookPageState extends State<BrowseBookPage> {

  final CategoryProv _cprov = ProvManager.categoryProv;
  final ContentProv _coprov = ProvManager.contentProv;
  late SearchController _searchController;
  late FocusNode _focusNode;

  @override
  void initState() {
    _searchController = SearchController();
    _focusNode = FocusNode();
    super.initState();
    ContentHandler.initTrendingBooks();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
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
                      onPressed:  (){
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
                      SearchHandler.enterSearchPage();
                      _focusNode.unfocus();
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
              Selector<CategoryProv, String>(
                selector: (context,prov)=>prov.mostPopular1Key,
                builder: (context,_,child)=> SectionWindow(
                  title:  AppStrs.hotKind,
                  fontSize: 22,
                  titleOnTap:() {
                    NavigationHelper.pushNamed(RouteCollector.category);
                  },
                  actionOnTap: null,
                  actionText: AppStrs.viewAll,
                  widgets: List.generate( _cprov.mostPopular1.length,
                      (index) => GradientImageCard(
                      image: Image.asset(
                        _cprov.cate1Cover(_cprov.mostPopular1[index]),
                        fit: BoxFit.cover,
                        width: 200,
                        height: 300,
                      ),
                      text: _cprov.cate1Name(index),
                      onTap: (){
                        ContentHandler.enterCategoryDetail(cate1: _cprov.mostPopular1[index]);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: UIParams.mediumGap),
              Padding(
                padding: const EdgeInsets.only(left: 18,bottom: 10),
                child: TextActionWidget(
                  text: SpecTextWidget.mediumTitle(text: AppStrs.trending, context: context),
                  size: 22,
                  onTap: (){},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 0),
                child: Selector<ContentProv,String>(
                  selector: (_,prov)=>prov.trendingBookKey,
                  builder: (_,strKey,__)=> Column(
                    children: ListExtension.separate<Widget>(
                      len: _coprov.trendingBooks.length,
                      generator: (index)=> ImageTile(
                        onTap: (){
                          ContentHandler.browseDetail(_coprov.trendingBooks[index]);
                        },
                        title: _coprov.trendingBooks[index].title,
                        subTitle: _coprov.trendingBooks[index].authorNamesStr,
                        thirdTitle: _coprov.trendingBooks[index].cate1Str,
                        subtitleColor: Theme.of(context).colorScheme.primary,
                        image: Hero(
                          tag: _coprov.trendingBooks[index].isbn,
                          child: getCustomCachedImage(
                            url: _coprov.trendingBooks[index].cover_l_url??'',
                            width: AppRepreConst.mediumBookW.w,
                            height: AppRepreConst.mediumBookW.w * AppRepreConst.bookCoverRatio,
                          ),
                        ),
                        actionWidget: null,
                        fontSize: 20,
                      ),
                      separatorGenerator: (index)=>LayoutBuilder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}