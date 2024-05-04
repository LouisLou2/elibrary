import 'package:elibrary/presentation/widget/costome_image_tile.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Record{
  final String? title;
  final String? subTitle;
  final String? thirdTitle;
  bool isTime;
  Record({this.title,this.subTitle,this.thirdTitle,this.isTime=false});
}

class RecordView extends StatefulWidget {
  const RecordView({Key? key}) : super(key: key);
  @override
  _RecordViewState createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  late List<Record>_records;
  @override
  void initState() {
    _records =[
      Record(
        isTime: true,
      ),
      ...List.generate(3, (index) => Record(
        title: '预约中',
        subTitle: 'Dart Apprentice',
        thirdTitle: '12-13 12:10 预约',
      )),
      Record(
        isTime: true,
      ),
      ...List.generate(3, (index) => Record(
        title: '预约中',
        subTitle: 'Dart Apprentice',
        thirdTitle: '12-13 12:10 预约',
      )),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: _records.map((e){
        if(e.isTime){
          return Container(
              padding: EdgeInsets.only(top:8.h),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                leading: Text(
                  '2023年(13)',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                trailing: Wrap(
                  children: [
                    Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.outline,
                      size: 18.sp,
                    ),
                    Text(
                        '筛选',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        )
                    ),
                  ],
                ),
              )
          );
        }
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 4.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
                blurRadius: 2.h,
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          child: CustomImageTile(
            title: '预约中',
            subTitle: 'Dart Apprentice',
            fontSize: 16.sp,
            surfaceColor2: Theme.of(context).colorScheme.primary,
            customTitleWidget: Row(
              children:[
                Text(
                  '12-13 12:10 预约',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).hintColor,
                    letterSpacing: -0.6,
                  ),
                ),
                SizedBox(width: UIParams.mediumGap.w,),
                Text(
                  '12-14 12:10 到期',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).hintColor,
                    letterSpacing: -0.6,
                  ),
                ),
              ],
            ),
            image: Image.network(
              'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
              fit: BoxFit.cover,
              width: 60,
              height: 90,
            ),
          )
        );
      }
      ).toList(),
    );
  }
}