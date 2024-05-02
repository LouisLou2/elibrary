import 'package:flutter/material.dart';

import '../../style/ui_params.dart';

class SettingSection extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  const SettingSection({super.key, required this.children, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding??const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
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
        children: children,
      ),
    );
  }
}