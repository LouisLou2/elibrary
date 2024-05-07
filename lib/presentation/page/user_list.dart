import 'package:elibrary/presentation/specific_style_widget/text_widget.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/image_tile.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  @override
  void initState() {
    super.initState();
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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, int index) {
            if(index==0) {
              return ListTile(
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
            return _buildUserTile(name: '宋浩', userId: 128763, location: 1, role: true);
          }
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
  Widget _buildUserTile({required String name,required int userId, required int location, required bool role}){
    return _buildResultContainer(
      items: [
        Padding(
          padding: EdgeInsets.only(bottom: UIParams.smallGap.h),
          child: ImageTile(
            onTap: () {
              Navigator.of(context).pushNamed('/browse_user');
            },
            backgroundColor: Theme.of(context).colorScheme.background,
            image: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                '宋',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            title: '叶圣陶',
            fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
            titleWeight: FontWeight.w500,
            subTitle: '同学  |  铁道校区',
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
}