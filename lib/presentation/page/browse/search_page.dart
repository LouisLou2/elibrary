import 'dart:async';

import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/state_management/prov/search_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/search_handler.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_strings.dart';
import '../../widget/image_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final SearchProv _sprov = ProvManager.searchProv;
  Timer? _searchThrottleTimer;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose(){
    if(_searchThrottleTimer!=null){
      _searchThrottleTimer!.cancel();
    }
    _sprov.toggleSearchedKeyword('',notify: false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProvManager.themeProv.mode==ThemeMode.light? Theme.of(context).scaffoldBackgroundColor.withAlpha(245):Colors.black,
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Hero(
                  tag: 'browsePage:searchBar',
                  child: SearchBar(
                    autoFocus: true,
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
                      print('@@@@@@@@@@@@onTap');
                    },
                    onChanged: (value){
                      // TODO: 未做防抖处理
                      _searchThrottle(value);
                    },
                    onSubmitted: (String u){
                        print('@@@@@@@@@@@@onSubmitted');
                    },
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Change brightness mode',
                        child: IconButton(
                          icon: const Icon(Icons.document_scanner_outlined), onPressed: () {  },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Selector<SearchProv, String>(
                selector: (_, prov) => prov.searchedKeyword,
                builder: (_, searchedKeyWord, __) {
                  if(searchedKeyWord.isEmpty){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:_buildSearchHistorySection(),
                    );
                  }else{
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: _getSearchContent(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSearchHistorySection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrs.searchHistory,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text(
                '清空',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 6,
          runSpacing: -8,
          children: List.generate(5, (index) => Chip(
            label: Text(
              'History $index',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                letterSpacing: -0.7,
               ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildResultContainer({required String sectionName, required List<Widget> items}){
    return items.isEmpty ? nil : Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(UIParams.defBorderR),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            offset: const Offset(0, 0),
            blurRadius: UIParams.defShadowBlurR,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                sectionName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const Spacer(),
              Text(
                AppStrs.more,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              Icon(
                CupertinoIcons.forward,
                size: Theme.of(context).textTheme.titleSmall?.fontSize,
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...items,
        ],
      ),
    );
  }
  Widget _getSearchContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoSegmentedControl(
          padding: const EdgeInsets.only(top: 15),
          onValueChanged: (value) {  },
          children: {
            0: _getSegmentedItem('全部'),
            1: _getSegmentedItem('作者'),
            2: _getSegmentedItem('图书'),
            3: _getSegmentedItem('出版社'),
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _buildResultContainer(
            sectionName: AppStrs.author,
            items: List.generate(_sprov.authors.length,
              (index) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ImageTile(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  image: CircleAvatar(
                    radius: 30,
                    child: Text(
                      _sprov.authors[index].avatarStr,
                    ),
                  ),
                  title: _sprov.authors[index].name,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  titleWeight: FontWeight.w500,
                  subTitle: '作者 | ${_sprov.authors[index].desc}',
                  onTap: (){},
                  actionWidget: Icon(
                    CupertinoIcons.forward,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _buildResultContainer(
            sectionName: AppStrs.publisher,
            items: List.generate(_sprov.publishers.length, (index) =>
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ImageTile(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  image: CircleAvatar(
                    radius: 30,
                    child: Text(
                      FormatTool.getDefAvatarStr(_sprov.publishers[index],'P'),
                    ),
                  ),
                  title: _sprov.publishers[0],
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  titleWeight: FontWeight.w500,
                  subTitle: '版权方 | 出版过 1000 本书',
                  onTap: (){},
                  actionWidget: Icon(
                    CupertinoIcons.forward,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _buildResultContainer(
            sectionName: AppStrs.book,
            items: List.generate(_sprov.books.length, (index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ImageTile(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    image:getCustomCachedImage(
                      url: _sprov.books[index].cover_l_url,
                      width: AppRepreConst.tinyBookW.w,
                      height: AppRepreConst.tinyBookW.w * AppRepreConst.bookCoverRatio,
                    ),
                    title: _sprov.books[index].title,
                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                    titleWeight: FontWeight.w500,
                    subTitle: '作者 | ${_sprov.books[index].authorNamesStr}',
                    thirdTitle: _sprov.books[index].publisher,
                    fontSize3: Theme.of(context).textTheme.bodySmall?.fontSize,
                    onTap: (){},
                    actionWidget: Icon(
                      CupertinoIcons.forward,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _getSegmentedItem(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
  void _searchThrottle(String keyword){
    if(_searchThrottleTimer!=null){
      _searchThrottleTimer!.cancel();
    }
    _searchThrottleTimer = Timer(const Duration(milliseconds: AppTransactionParam.throttleTime), (){
      SearchHandler.search(keyword);
    });
  }
}