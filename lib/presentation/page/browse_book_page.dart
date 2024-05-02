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

class BrowseBookPage extends StatefulWidget {
  const BrowseBookPage({super.key});

  @override
  State<BrowseBookPage> createState() => _BrowseBookPageState();
}

class _BrowseBookPageState extends State<BrowseBookPage> {

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
                  title: AppStrs.browse,
                  size: 37,
                ),
              ),
              const SizedBox(height: UIParams.mediumGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 0),
                child: SearchAnchor(
                  searchController: _searchController,
                  builder: (BuildContext context,SearchController controller){
                    return SearchBar(
                      controller: controller,
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
                        controller.openView();
                      },
                      onChanged: (_){
                        print('@@@@@@@@@@@@onChanged');
                        controller.openView();
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
                    );
                  },
                  suggestionsBuilder: (BuildContext context,SearchController controller){
                    return List<ListTile>.generate(5, (int index){
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: (){
                          controller.closeView(item);
                        },
                      );
                    });
                  },
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
                  text: SpecTextWidget.mediumTitle(AppStrs.trending, context),
                  size: 22,
                  onTap: (){},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 0),
                child:Column(
                  children: ListExtension.separate(
                    6,
                        (index)=>ImageTile(
                      title: 'Dart Apprentice',
                      subTitle: 'Leo Dion, Peter Friese',
                      thirdTitle: '2021-12-3',
                      image: Image.network(
                        'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 120,
                      ),
                      actionWidget: null,
                      fontSize: 20,
                    ),
                    (index)=>LayoutBuilder(
                      builder: (BuildContext context,BoxConstraints constraints){
                        return Divider(
                          height: 10,
                          indent: constraints.maxWidth*0.35,
                          endIndent: 20,
                        );
                      },
                    )
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