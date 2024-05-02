// import 'package:flutter/cupertino.dart';
//
// class IconTextWidget extends StatelessWidget{
//   Widget? icon;
//   String text;
//   IconTextWidget({super.key, required this.text,this.icon,this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       decoration: const BoxDecoration(),
//       child: InkWell(
//         onTap: onTap,
//         child: Row(
//           children: [
//             if(icon!=null)icon!,
//             const SizedBox(width: 10,),
//             Text(
//               text,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }