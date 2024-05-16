import 'package:elibrary/presentation/widget/info_display/desc_bottomsheet.dart';
import 'package:elibrary/state_management/prov/author_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/author_handler.dart';
import 'package:elibrary/usecase/handler/content_handler.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../constant/app_strings.dart';
import '../../../constant/data_enum.dart';
import '../../../domain/entity/book_info.dart';
import '../../specific_style_widget/image_widget.dart';
import '../../widget/image_tile.dart';

class AuthorPage extends StatefulWidget{
  const AuthorPage({super.key});

  @override
  State<StatefulWidget> createState()=>_AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage>{

  final _aprov = ProvManager.authorProv;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 45,
        surfaceTintColor: Colors.transparent,
        title: Selector<AuthorProv,Tuple3<int,DataEnum,DataEnum>>(
          selector: (_,prov)=>prov.nowStatusAndLen,
          builder: (_,data,__){
            if(data.item2 != DataEnum.SUCCESS){
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SearchBar(
                hintText: '搜索${_aprov.nowAuthor.name}的作品',
                hintStyle: MaterialStateProperty.all(
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                constraints: const BoxConstraints(
                  maxHeight: 35,
                  minHeight: 35,
                ),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).hoverColor),
                elevation: MaterialStateProperty.all(0),
              ),
            );
          },
        ),
      ),
      body: Selector<AuthorProv,Tuple3<int,DataEnum,DataEnum>>(
        selector: (_,prov)=>prov.nowStatusAndLen,
        builder: (_,data,__){
          switch(data.item2){
            case DataEnum.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DataEnum.ERROR:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      AppStrs.loadError,
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).hoverColor,
                        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      onPressed: (){
                        rereyButtonPressed();
                      },
                      child: Text(
                        AppStrs.retry,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              );
            case DataEnum.SUCCESS:
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child:ListView(
                  children: <Widget>[
                    const SizedBox(height: UIParams.mediumGap),
                    InkWell(
                      onTap: onTapAuthorTile,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(UIParams.mediumBorderR),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                                  child: Text(
                                    _aprov.nowAuthor.avatarStr,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _aprov.nowAuthor.name,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                subtitle: const Text(
                                  '作者',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                trailing: FilledButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(CupertinoColors.systemBlue),
                                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(UIParams.bigBorderR),
                                      ),
                                    ),
                                  ),
                                  onPressed: (){},
                                  child: Text(
                                    '关注',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.surface,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.9,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                                child: Text(
                                  _aprov.nowAuthor.desc??'暂无简介',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: UIParams.largeGap),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                      ),
                      child: Selector<AuthorProv,Tuple3<int,DataEnum,DataEnum>>(
                        selector: (_,prov)=>prov.nowStatusAndLen,
                        builder: (_,data,__){
                          // wholePageState也就是item2已经在上层的Selector中被取出来了，这里只考虑item3和item1
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(data.item1+2,
                              (index){
                                if(index==0){
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 18, top: 10),
                                    child:Text(
                                      '全部作品',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                  );
                                }
                                if(index==data.item1+2-1){
                                  if(data.item1==0) {
                                    return const Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 40),
                                        child: Text(
                                          '暂无作品',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                }
                                return ImageTile(
                                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                                  title: _aprov.authorBooks[index-1].title,
                                  subTitle: _aprov.authorBooks[index-1].authorNamesStr,
                                  thirdTitle: _aprov.authorBooks[index-1].publisher,
                                  image: getCustomCachedImage(
                                    url: _aprov.authorBooks[index-1].cover_l_url,
                                    width: 65,
                                    height: 90,
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
                                  onTap: ()=>onTapBookTile(_aprov.authorBooks[index-1]),
                                  fontSize: 18,
                                  fontSize3: 12,
                                );
                              },
                            ),
                          );
                        }
                      )
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
  
  void rereyButtonPressed(){
    AuthorHanler.reloadAuthorDetail(_aprov.authorId);
  }
  
  void onTapAuthorTile(){
    showDescBottomSheet(
      context: context,
      title: '作者简介',
      desc: _aprov.nowAuthor.desc,
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }

  void onTapBookTile(BookInfo bookInfo){
    ContentHandler.browseDetail(bookInfo);
  }
}