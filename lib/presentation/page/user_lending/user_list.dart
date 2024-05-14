import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/state_management/prov/user_lending_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/user_lend_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../domain/entity/simple_user.dart';
import '../../widget/image_tile.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  final UserLendingProv _ulprov = ProvManager.userLendingProv;
  late ScrollController _scrollController;
  ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //if(_scrollController.hasClients){}
      _scrollController.addListener(() {
        if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          _loadMore();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  void _loadMore() async{
    if(_isLoading.value) {
      return;
    }
    setState(() {
      _isLoading.value = true;
    });
    await UserLendHandler.updateUserListAsUsual(isbn: _ulprov.nowBookInfo.isbn);
    setState(() {
      _isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProvManager.themeProv.mode==ThemeMode.light? Theme.of(context).scaffoldBackgroundColor.withAlpha(245):Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Text(
          '互借',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Selector<UserLendingProv, int>(
          selector: (_, prov) => prov.userList.length,
          builder: (_, len, __) => ValueListenableBuilder<bool>(
            valueListenable: _isLoading,
            builder: (_, isLoading, __) {
              if(len == 0 && !isLoading) {
                return Center(
                  child: Text(
                    '暂无数据',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: len+1,
                itemBuilder: (context, int index) {
                  if(index==0) {
                    return ListTile(
                      key: ValueKey<int>(_ulprov.userList[index].userId),
                      contentPadding: const EdgeInsets.only(top: UIParams.mediumGap),
                      title: SpecTextWidget.mediumTitle(text: '他们拥有这本书', context: context),
                      subtitle: Text(
                        '点击向他们提出借阅请求',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    );
                  }
                  return _buildUserTile(_ulprov.userList[index-1]);
                }
              );
            },
          ),
        ),
      ),
    );
  }
  Widget _buildResultContainer({required List<Widget> items}){
    return Container(
      margin: const EdgeInsets.only(top: UIParams.mediumGap),
      padding: const EdgeInsets.all(UIParams.defPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(UIParams.defBorderR),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }

  Widget _buildUserTile(SimpleUser simpleUser){
    return _buildResultContainer(
      items: [
        Padding(
          padding: EdgeInsets.only(bottom: UIParams.smallGap.h),
          child: ImageTile(
            onTap: () => browseUser(simpleUser),
            backgroundColor: Theme.of(context).colorScheme.background,
            image: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                simpleUser.name[0],
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            title: simpleUser.name,
            fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
            titleWeight: FontWeight.w500,
            subTitle: '${simpleUser.roleStr}  |  ${simpleUser.locationStr}',
            subtitleColor: Theme.of(context).colorScheme.primary,
            actionWidget: Icon(
              CupertinoIcons.forward,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
  void browseUser(SimpleUser suser){
    UserLendHandler.enterBrowseUserPage(suser);
  }
}