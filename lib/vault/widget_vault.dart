import 'package:flutter/material.dart';

import '../constant/app_strings.dart';
import '../presentation/widget/action_card.dart';
import '../style/ui_params.dart';

Widget settingSection(BuildContext context){
  return Row(
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
  );
}