import 'package:elibrary/extension/core_extension.dart';
import 'package:elibrary/presentation/widget/action_card.dart';
import 'package:elibrary/presentation/widget/image_tile.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/app_strings.dart';
import '../widget/custom_image_card.dart';
import '../widget/info_display/headline2.dart';
import '../widget/text_action_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:Column(
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 30,
                    ),
                  ),
                ],
              ),
              HeadLine2(
                title: AppStrs.account,
                size: 37,
              ),
              const Divider(
                height: 8,
                thickness: 1.5,
              ),
              const SizedBox(height: UIParams.mediumGap,),
              ImageTile(
                image: Image.asset(
                  'assets/images/avatar1.png',
                  width: 100,
                ),
                circleImage: true,
                title: 'Leo Chen',
                subTitle: '8209210345@csu.edu.cn',
                fontSize: 22,
              ),
              const SizedBox(height: UIParams.mediumGap),
              Align(
                alignment: Alignment.centerRight,
                child: Chip(
                  avatar: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  label: Text(
                    AppStrs.editProfile,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ActionCard(
                      titleIcon: const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                      ),
                      title: Text(
                        AppStrs.star,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      innerWidget: Text(
                        '23本书',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 22,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: UIParams.smallGap,),
                  Expanded(
                    child:ActionCard(
                      titleIcon: const Icon(
                        Icons.history,
                      ),
                      title: Text(
                        AppStrs.history,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      innerWidget: Text(
                        '23本书',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 22,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: UIParams.largeGap),
              TextActionWidget(
                text: Text(
                  AppStrs.moreSetting,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                size: 22,
                onTap: (){},
              ),
              const SizedBox(height: UIParams.mediumGap),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children:ListExtension.separate(
                    4,
                    (index)=>ListTile(
                      leading: Icon(
                        Icons.palette_outlined,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      title: Text(
                        '账户安全',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                    (index)=>const Divider(
                      height: 10,
                      thickness: 1.0,
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