import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:elibrary/state_management/prov/record_prov.dart';
import 'package:elibrary/style/ui_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constant/app_strings.dart';
import '../../../state_management/prov_manager.dart';
import '../../../style/app_colors.dart';
import '../../../util/format_util.dart';
import '../../specific_style_widget/image_widget.dart';
import '../../widget/info_display/headline2.dart';

class NonReservationDetail extends StatefulWidget {
  const NonReservationDetail({super.key});

  @override
  State<NonReservationDetail>  createState() => _NonReservationDetailState();
}

class _NonReservationDetailState extends State<NonReservationDetail> {
  final RecordProv _rprov=ProvManager.recordProv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w,20.h),
              color: _rprov.nowRecord.isGoodStatus ? AppColors.deepGreen: AppColors.ruby,
              child: Column(
                children: [
                  HeadLine2(
                    title: AppStrs.borrowDetail,
                    size: 28.sp,
                    color: Colors.white,
                  ),
                  SizedBox(height: UIParams.mediumGap.h,),
                  Text(
                    _rprov.nowRecord.statusStr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: const Alignment(0.0, 0),
                  colors: [
                    _rprov.nowRecord.isGoodStatus ? AppColors.deepGreen: AppColors.ruby,
                    Theme.of(context).colorScheme.background,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        minWidth: 300.w,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background.withAlpha(130),
                        borderRadius: BorderRadius.circular(UIParams.defBorderR.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _rprov.nowRecord.libName,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 110.w,),
                                Icon(
                                  Icons.phone_rounded,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                                SizedBox(width: 5.w,),
                                Icon(
                                  Icons.location_on_rounded,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                            constraints: BoxConstraints(
                              minWidth: 320.w,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(UIParams.defBorderR.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).colorScheme.onSurface.withAlpha(30),
                                  offset: const Offset(0, 1),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FormatTool.trimText(_rprov.nowRecord.bookInfo.title,maxLength: 20),
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.7,
                                      ),
                                    ),
                                    Text(
                                      FormatTool.trimText(_rprov.nowRecord.bookInfo.authorNamesStr,maxLength: 35),
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    SizedBox(height: UIParams.smallGap.h,),
                                    Text(
                                      '位置代码',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    Text(
                                      'OUIH THYU',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    SizedBox(height: UIParams.mediumGap.h,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '发起时间',
                                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            Text(
                                              FormatTool.dateScaleStr2(_rprov.nowRecord.reserveTime),
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            Text(
                                              FormatTool.hourStr(_rprov.nowRecord.reserveTime.hour),
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: UIParams.largerGap.w,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '期限',
                                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            Text(
                                              FormatTool.dateScaleStr2(_rprov.nowRecord.dueTime),
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                            Text(
                                              FormatTool.hourStr(_rprov.nowRecord.dueTime.hour),
                                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(UIParams.smallBorderR),
                                  child: getCustomCachedImage(
                                    url: _rprov.nowRecord.bookInfo.cover_l_url,
                                    width: 90.w,
                                    height: 110.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: UIParams.mediumGap.h,),
                    _buildSection(
                      context,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '预约码(已失效)',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 19,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          _getDivider(context,50.w),
                          SizedBox(height: UIParams.mediumGap.h,),
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.surface.withOpacity(0.7), BlendMode.dstOut),
                            child: Column(
                              children: [
                                QrImageView(
                                  data: _rprov.nowRecord.reserveCode,
                                  version: QrVersions.auto,
                                  size: 200,
                                  gapless: false,
                                  eyeStyle: QrEyeStyle(
                                    eyeShape: QrEyeShape.square,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                  dataModuleStyle: QrDataModuleStyle(
                                    dataModuleShape: QrDataModuleShape.square,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                SizedBox(height: UIParams.mediumGap.h,),
                                Text(
                                  '或输入代码',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                SizedBox(height: UIParams.smallGap.h,),
                                OutlinedButton(
                                  onPressed: null,
                                  child: Text(
                                    _rprov.nowRecord.reserveCode,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: UIParams.largeGap.h,),
                    _buildSection(
                      context,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '更改&取消',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontSize: 19,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            _getDivider(context,50.w),
                            SizedBox(height: UIParams.mediumGap.h,),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: Theme.of(context).colorScheme.error,
                                    ),
                                    SizedBox(width: UIParams.smallGap.w,),
                                    Text(
                                      '超出更改时间',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    SizedBox(width: UIParams.smallGap.w,),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Theme.of(context).colorScheme.secondary,
                                      size: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    ),
                                  ],
                                ),
                                SizedBox(height: UIParams.mediumGap.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.xmark_circle,
                                      color: Theme.of(context).colorScheme.error,
                                    ),
                                    SizedBox(width: UIParams.smallGap.w,),
                                    Text(
                                      '已不可取消预约',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                    ),
                                    SizedBox(width: UIParams.smallGap.w,),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Theme.of(context).colorScheme.secondary,
                                      size: Theme.of(context).textTheme.titleSmall?.fontSize,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: UIParams.mediumGap.h,),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: UIParams.smallGap.h,),
                    Container(
                      constraints: BoxConstraints(
                        minWidth: 320.w,
                      ),
                      child:Text(
                        '*频繁取消预约可能会影响您的信用分数',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    SizedBox(height: UIParams.largeGap.h,),
                    _buildSection(
                      context,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '借阅须知',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontSize: 19,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            _getDivider(context,70.w),
                            SizedBox(height: UIParams.mediumGap.h,),
                            ...List.generate(LibTranscationInfo.libRules.length, (index) => Text(
                              LibTranscationInfo.libRules[index],
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 5,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: UIParams.largerGap.h,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSection(BuildContext context,Widget child){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      constraints: BoxConstraints(
        minWidth: 320.w,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(UIParams.defBorderR.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(30),
            blurRadius: 2.5,
          )
        ],
      ),
      child:child,
    );
  }
  Widget _getDivider(BuildContext context,double maxWidth){
    return Container(
      height: 3.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(UIParams.defBorderR),
      ),
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
    );
  }
}