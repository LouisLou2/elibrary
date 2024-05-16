import 'package:flutter/material.dart';

void showDescBottomSheet({required BuildContext context,required String title,String? desc,required double height}){
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (context){
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SelectionArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    desc??'暂无',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ),
      );
    },
  );
}