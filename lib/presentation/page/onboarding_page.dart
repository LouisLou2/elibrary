import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:elibrary/presentation/helper/toast_helper.dart';
import 'package:elibrary/usecase/nav/navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/app_properties.dart';
import '../../constant/app_strings.dart';

class OnBoardingPage extends StatefulWidget {

  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> features = [
      // Feature's type must be `WhatsNewFeature`
      WhatsNewFeature(
        icon: Icon(
          CupertinoIcons.book,
          color: CupertinoColors.systemBlue.resolveFrom(context),
        ),
        title: Text(AppProperties.features[0].title),
        description: Text(
          AppProperties.features[0].desc,
        ),
      ),
      WhatsNewFeature(
        icon: Icon(
          Icons.task_alt_outlined,
          color: CupertinoColors.systemBlue.resolveFrom(context),
        ),
        title: Text(AppProperties.features[1].title),
        description: Text(
          AppProperties.features[1].desc,
        ),
      ),
      WhatsNewFeature(
        icon: Icon(
          CupertinoIcons.wand_stars,
          color: CupertinoColors.systemBlue.resolveFrom(context),
        ),
        title: Text(AppProperties.features[2].title),
        description: Text(
          AppProperties.features[2].desc,
        ),
      ),
    ];
    return CupertinoOnboarding(
      //bottomButtonColor: AppColors.discoBallBlue,
      bottomButtonBorderRadius: BorderRadius.circular(8),
      onPressed: NavigationHelper.popAllAndAuth,
      onPressedOnLastPage: NavigationHelper.popAllAndAuth,
      bottomButtonColor: CupertinoColors.systemBlue.resolveFrom(context),
      bottomButtonChild: Text(
        AppStrs.signIn,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        ),
      ),
      pages: [
        CupertinoOnboardingPage(
          title: Column(
            children: [
              const Text(
                AppStrs.logInToEnjoy,
              ),
              Text(
                AppStrs.bookResources,
                style: TextStyle(
                  color: CupertinoColors.activeBlue.resolveFrom(context),
                ),
              ),
            ],
          ),
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 25),
            itemCount: features.length,
            itemBuilder: (context, index) {
              return features[index];
            },
          ),
        ),
      ],
    );
  }
}