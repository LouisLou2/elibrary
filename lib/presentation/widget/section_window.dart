import 'package:elibrary/presentation/widget/text_action_widget.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWindow extends StatelessWidget{
  final String title;
  final VoidCallback? titleOnTap;
  final String actionText;
  final VoidCallback? actionOnTap;
  final List<Widget>widgets;
  final double? fontSize;
  SectionWindow({super.key, required this.title,required this.actionText,this.actionOnTap,required this.widgets,this.fontSize,this.titleOnTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      constraints: BoxConstraints(
        maxWidth: 340.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UIParams.defBorderR),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 8),
            child: TextActionWidget(
              text: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              size: fontSize,
              onTap: titleOnTap,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: widgets.length,
            itemBuilder: (BuildContext context,int index){
              return widgets[index];
            },
          ),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextActionWidget(
                text: Text(
                  actionText,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                size: fontSize,
                  onTap: titleOnTap,
                ),
            ],
          ),
        ],
      ),
    );
  }
}