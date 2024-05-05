import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';
import '../widget/image_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late SearchController _searchController;

  @override
  void initState() {
    _searchController = SearchController();
    super.initState();
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
                  child:SearchBar(
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
                    onChanged: (_){
                      print('@@@@@@@@@@@@onChanged');
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: _buildResultContainer(
                  sectionName: AppStrs.author,
                  items: [
                    ImageTile(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      image: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/avatar1.png'),
                      ),
                      title: '叶圣陶',
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      titleWeight: FontWeight.w500,
                      subTitle: '作者 | Author Description',
                      onTap: (){},
                      actionWidget: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: _buildResultContainer(
                  sectionName: AppStrs.publisher,
                  items: [
                    ImageTile(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      image: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/avatar1.png'),
                      ),
                      title: '人民邮电出版社',
                      fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                      titleWeight: FontWeight.w500,
                      subTitle: '版权方 | 出版过 1000 本书',
                      onTap: (){},
                      actionWidget: Icon(
                        CupertinoIcons.forward,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: _buildResultContainer(
                  sectionName: AppStrs.book,
                  items: List.generate(7, (index) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ImageTile(
                        backgroundColor: Theme.of(context).colorScheme.background,
                        image: Image.network(
                          'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                          fit: BoxFit.cover,
                          width: 58,
                          height: 80,
                        ),
                        title: 'Dart Apprentice',
                        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                        titleWeight: FontWeight.w500,
                        subTitle: '作者 | Author Description',
                        thirdTitle: '人民邮电出版社',
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
          ),
        ),
      ),
    );
  }
  Widget _buildSearchHistorySection(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrs.searchHistory,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: -8,
          children: List.generate(5, (index) => Chip(
            label: Text(
              'History $index',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                letterSpacing: -0.7,
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
  Widget _buildResultContainer({required String sectionName, required List<Widget> items}){
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(UIParams.defBorderR),
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
}