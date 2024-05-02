import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget{
  final Icon titleIcon;
  final Text title;
  final Widget? innerWidget;
  final VoidCallback? onTap;
  final Color? cardColor;
  const ActionCard({super.key, required this.titleIcon, required this.title, this.innerWidget, this.onTap, this.cardColor});
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: cardColor??Theme.of(context).colorScheme.onSecondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        titleIcon,
                        title,
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
                Center(
                  child:Padding(
                    padding: const EdgeInsets.all(18),
                    child: innerWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}