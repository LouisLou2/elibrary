import 'package:elibrary/constant/book_const.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/widget/image_tile.dart';
import 'package:elibrary/state_management/prov/category_prov.dart';
import 'package:elibrary/usecase/handler/content_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/data_enum.dart';
import '../../../state_management/prov_manager.dart';

class CategoryBook extends StatefulWidget{
  const CategoryBook({super.key});
  @override
  State<CategoryBook> createState()=>_CategoryBookState();
}

class _CategoryBookState extends State<CategoryBook>{

  late ScrollController _scrollController;
  final CategoryProv _cprov = ProvManager.categoryProv;
  late CateChild cateChild;
  late int begin;
  late int end;

  @override
  void initState(){
    _scrollController = ScrollController();
    cateChild = BookConst.cateChildList[_cprov.nowCategory1];
    begin = cateChild.begin;
    end = cateChild.end;
    // 滚动监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        ContentHandler.autoLoadMoreCate12Books();
      }
    });
    super.initState();
  }

  @override
  void dispose(){
    _scrollController.dispose();
    _cprov.disposeForCateBook();
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
          Selector<CategoryProv,Tuple2<String,DataEnum>>(
            selector: (_, prov) => prov.nowListAndStatus,
            builder: (context,nowlistAndStatus,_) {
              if(_cprov.cate12Books.isEmpty && _cprov.dataEnum != DataEnum.LOADING){
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrs.loadError,
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).hoverColor,
                          foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () => ContentHandler.reqToReloadPage(),
                        child: Text(
                          AppStrs.retry,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Expanded(
                child: Selector<CategoryProv, Tuple2<String,DataEnum>>(
                  selector: (_, prov) => prov.nowListAndStatus,
                  builder: (context, listAndStatus, _) => ListView.builder(
                    controller: _scrollController,
                    itemCount: _cprov.cate12Books.length + 1,//加一个用于显示loading或者没有更多或者重试
                    itemBuilder: (BuildContext context, int index) {
                      if(index==_cprov.cate12Books.length){
                        if(_cprov.dataEnum==DataEnum.LOADING) return const Center(child: CircularProgressIndicator());
                        if(_cprov.dataEnum==DataEnum.NO_MORE) return const Center(child: Text('没有更多了'));
                        if(_cprov.dataEnum==DataEnum.ERROR) {
                          return Center(
                            child:CupertinoButton(
                              onPressed:() => ContentHandler.loadMoreCate12Books(),
                              child: const Text(AppStrs.retry),
                            ),
                          );
                        }
                        if(_cprov.dataEnum==DataEnum.OLD){
                          return Center(
                            child:CupertinoButton(
                              onPressed:() => ContentHandler.reqToReloadPage(),
                              child: const Text(AppStrs.retry),
                            ),
                          );
                        }
                        return nil;
                      }
                      return ImageTile(
                        key: ValueKey(_cprov.cate12Books[index].isbn),
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
                        onTap: ()=>_onTapATile(index),
                        fontSize: 18,
                        fontSize3: 13,
                      );
                    },
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
  }

  void _onTapCategory2(int cateCode){
    ContentHandler.changeCategory2(newCate2: cateCode);
  }
  void _onTapATile(int index){
    // 这里index就是CategoryProv中的cate12Books的index,
    ContentHandler.browseDetail(_cprov.cate12Books[index]);
  }
}