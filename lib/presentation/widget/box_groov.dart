import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxGroove extends StatelessWidget{

  Text? title;
  VoidCallback? titleOnTap;

  List<Widget>widgets;
  BoxGroove({this.title,this.titleOnTap,required this.widgets});

  @override
  Widget build(BuildContext context) {
    //assert(!(title==null&&titleOnTap!=null));
    return Column(
      children: [
      if(title!=null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
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
            children: widgets,
          ),
        ),
      ],
    );
  }
}