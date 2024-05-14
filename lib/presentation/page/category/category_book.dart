import 'package:elibrary/constant/book_const.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/widget/image_tile.dart';
import 'package:elibrary/state_management/prov/category_prov.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/content_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_management/prov_manager.dart';
import '../../widget/costome_image_tile.dart';

class CategoryBook extends StatefulWidget{
  const CategoryBook({super.key});
  @override
  State<CategoryBook> createState()=>_CategoryBookState();
}

class _CategoryBookState extends State<CategoryBook>{

  late ScrollController _scrollController;
  late CategoryProv _cprov;
  late CateChild cateChild;
  late int begin;
  late int end;

  @override
  void initState(){
    _scrollController = ScrollController();
    _cprov = ProvManager.categoryProv;
    cateChild = BookConst.cateChildList[_cprov.nowCategory1];
    begin = cateChild.begin;
    end = cateChild.end;
    super.initState();
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          _cprov.nowCategory1Name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Wrap(
              runSpacing: -20,
              children: List.generate(
                end-begin+1, (index) => Selector<CategoryProv, int>(
                  selector: (_, prov) => prov.nowCategory2,
                  builder: (context, nowCategory2, _) =>TextButton(

                    onPressed: () => _onTapCategory2(begin+index),

                    child: begin+index==nowCategory2 ? Text(
                      BookConst.getCategory2Name(begin+index),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        color: CupertinoColors.activeBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ):
                    Text(
                      BookConst.getCategory2Name(begin+index),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
            child: Divider(
              color: Theme.of(context).dividerColor,
              thickness: 0.8,
            ),
          ),
          Expanded(
            child: Selector<CategoryProv, int>(
              selector: (_, prov) => prov.cate12Books.length,
              builder: (context, len, _) => ListView.builder(
                controller: _scrollController,
                itemCount: len,
                itemBuilder: (BuildContext context, int index) {
                  return ImageTile(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    title: _cprov.cate12Books[index].title,
                    subTitle: _cprov.cate12Books[index].authorNamesStr,
                    thirdTitle: _cprov.cate12Books[index].publisher,
                    image: getCustomCachedImage(
                      url: _cprov.cate12Books[index].cover_l_url,
                      width: 80,
                      height: 110,
                    ),
                    actionWidget: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: BorderSide.none,
                      avatar: Icon(
                        CupertinoIcons.star_fill,
                        size: 15,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      elevation: 10,
                      label: Text(
                        '7668',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                      ),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    titleWeight: FontWeight.w500,
                    onTap: () {},
                    fontSize: 18,
                    fontSize3: 13,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapCategory2(int cateCode){
    ContentHandler.changeCategory2(newCate2: cateCode);
  }
}