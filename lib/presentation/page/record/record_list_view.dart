import 'package:elibrary/domain/resp_model/user_lending/record_list_resp.dart';
import 'package:elibrary/presentation/specific_style_widget/image_widget.dart';
import 'package:elibrary/presentation/widget/costome_image_tile.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:elibrary/usecase/handler/user_book_handler.dart';
import 'package:elibrary/util/format_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../state_management/prov/record_prov.dart';
import '../../../state_management/prov_manager.dart';

class Record{
  final String? title;
  final String? subTitle;
  final String? thirdTitle;
  bool isTime;
  Record({this.title,this.subTitle,this.thirdTitle,this.isTime=false});
}

class RecordView extends StatefulWidget {
  const RecordView({super.key});
  @override
  State<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> {
  final RecordProv _rprov=ProvManager.recordProv;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Selector<RecordProv,int>(
      selector: (context,recordProv)=>recordProv.recordList.length,
      builder: (context,len,child) {
        return ListView.builder(
          itemCount: len,
          itemBuilder: (context,index)=>Container(
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
              onTap: ()=>toDetailPage(_rprov.recordList[index]),
              title: _rprov.recordList[index].statusStr,
              subTitle: FormatTool.trimText(_rprov.recordList[index].title),
              fontSize: 16.sp,
              surfaceColor2: Theme.of(context).colorScheme.primary,
              customTitleWidget: Row(
                children:[
                  Text(
                    '${FormatTool.monthDayHourStr(_rprov.recordList[index].reserveTime)} 预约',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).hintColor,
                      letterSpacing: -0.6,
                    ),
                  ),
                  SizedBox(width: UIParams.mediumGap.w,),
                  Text(
                    '${FormatTool.monthDayHourStr(_rprov.recordList[index].deadline)} 到期',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).hintColor,
                      letterSpacing: -0.6,
                    ),
                  ),
                ],
              ),
              image: getCustomCachedImage(
                url: _rprov.recordList[index].cover_l_url,
                width: 60,
                height: 90,
              ),
            ),
          ),
        );
      }
    );
  }
}

void toDetailPage(LendingRecord record){
  UserBookHandler.enterRecordDetailPage(record);
}

// if(e.isTime){
//   return Container(
//       padding: EdgeInsets.only(top:8.h),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
//         leading: Text(
//           '2023年(13)',
//           style: Theme.of(context).textTheme.titleMedium?.copyWith(
//             fontSize: 16.sp,
//             color: Theme.of(context).colorScheme.onSurface,
//           ),
//         ),
//         trailing: Wrap(
//           children: [
//             Icon(
//               Icons.search,
//               color: Theme.of(context).colorScheme.outline,
//               size: 18.sp,
//             ),
//             Text(
//                 '筛选',
//                 style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                   color: Theme.of(context).colorScheme.outline,
//                 )
//             ),
//           ],
//         ),
//       )
//   );
// }