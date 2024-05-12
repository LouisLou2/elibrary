import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxGroove extends StatelessWidget{

  final Widget? title;
  final VoidCallback? titleOnTap;

  final List<Widget> widgets;
  const BoxGroove({super.key, this.title,this.titleOnTap,required this.widgets});

  @override
  Widget build(BuildContext context) {
    //assert(!(title==null&&titleOnTap!=null));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      if(title!=null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
          child: GestureDetector(
            onTap: titleOnTap,
            child: Row(
              children: [
                title!,
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widgets,
          ),
        ),
      ],
    );
  }
}