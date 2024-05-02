import 'package:elibrary/extension/core_extension.dart';
import 'package:elibrary/presentation/widget/action_card.dart';
import 'package:elibrary/presentation/widget/image_tile.dart';
import 'package:elibrary/presentation/widget/setting_section.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/app_strings.dart';
import '../../style/app_colors.dart';
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
              Expanded(
                child:ListView(
                  shrinkWrap: true,
                  children:[
                    SettingSection(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                      children: [
                        ImageTile(
                          image: Image.asset(
                            'assets/images/avatar1.png',
                            width: 60,
                          ),
                          circleImage: true,
                          title: 'Leo Chen',
                          subTitle: '8209210345@csu.edu.cn',
                          fontSize: 22,
                          actionWidget: Chip(
                            label: Text(
                              AppStrs.editProfile,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: UIParams.mediumGap),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: UIParams.largeGap),
                        child: Text(
                          '你的姓名将向其他人展示',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SettingSection(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildNumSection(AppStrs.star, 12, () { }),
                            _buildNumSection(AppStrs.history, 56, () { }),
                            _buildNumSection(AppStrs.query, 23, () { }),
                          ],
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top:UIParams.defPadding,bottom: UIParams.largeGap),
                        child: Text(
                          '轻触以查看全部',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SettingSection(
                      children: [
                        _buildSettingTitle(icon: Icons.timer, iconColor: Colors.blueAccent,title: AppStrs.myReservations, onTap: () { }),
                        const Divider( height: 1, thickness: 1, indent: 14,),
                        _buildSettingTitle(icon: Icons.book, iconColor: Colors.amber,title: AppStrs.myBorrowed, onTap: () { }),
                        const Divider( height: 1, thickness: 1, indent: 14,),
                        _buildSettingTitle(icon: Icons.timeline_rounded, iconColor: AppColors.rustyRed,title: AppStrs.myFines, onTap: () { }),
                      ],
                    ),
                    const SizedBox(height: UIParams.largeGap),
                    SettingSection(
                      children: [
                        _buildSettingTitle(icon: Icons.palette_rounded, iconColor: AppColors.oilGreen,title: AppStrs.appearance, onTap: () { }),
                        const Divider( height: 1, thickness: 1, indent: 14,),
                        _buildSettingTitle(icon: Icons.settings, iconColor: Colors.grey,title: AppStrs.moreSetting, onTap: () { }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumSection(String title,int num,VoidCallback onTap){
    return MaterialButton(
      onPressed: onTap,
      child: Column(
        children: [
          Text(
            '$num',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
  Widget _wrappedIcon(IconData icon, {Color? color}){
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color?.withOpacity(0.3),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
  Widget _buildSettingTitle({required IconData icon,Color? iconColor, required String title,required VoidCallback onTap}){
    return MaterialButton(
      onPressed: onTap,
      child:ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        leading: _wrappedIcon(
            icon,
            color: iconColor
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 19,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    );
  }
}