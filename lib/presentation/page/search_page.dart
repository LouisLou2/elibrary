import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/presentation/widget/gradient_image_card.dart';
import 'package:elibrary/presentation/widget/section_window.dart';
import 'package:elibrary/presentation/widget/text_action_widget.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';
import '../widget/custom_image_card.dart';
import '../widget/image_tile.dart';
import '../widget/info_display/headline2.dart';
import '../../extension/core_extension.dart';

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
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Hero(
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
                const SizedBox(height: UIParams.mediumGap),
                _buildSearchHistorySection(context),
              ],
            ),
          )
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
}