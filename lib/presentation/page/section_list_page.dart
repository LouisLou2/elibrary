// import 'package:elibrary/style/ui_params.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../widget/image_tile.dart';
//
// class SectionListPage extends StatefulWidget {
//   const SectionListPage({super.key});
//
//   @override
//   State<SectionListPage> createState() => _SectionListPageState();
// }
//
// class _SectionListPageState extends State<SectionListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           '精选推荐',
//           style: Theme.of(context).textTheme.titleLarge?.copyWith(
//             letterSpacing: -0.6,
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: UIParams.mediumGap.w, vertical: UIParams.smallGap.h),
//             child: ImageTile(
//               backgroundColor: Theme.of(context).colorScheme.background,
//               image: Image.network(
//                 'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
//                 fit: BoxFit.cover,
//                 width: AppRepreConst.smallBookW.w,
//                 height: AppRepreConst.smallBookW.w * AppRepreConst.bookCoverRatio,
//               ),
//               title: 'Dart Apprentice',
//               fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
//               titleWeight: FontWeight.w500,
//               subTitle: '作者 | Author Description',
//               thirdTitle: '人民邮电出版社',
//               fontSize3: Theme.of(context).textTheme.bodySmall?.fontSize,
//               onTap: (){},
//               actionWidget: Icon(
//                 CupertinoIcons.forward,
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }