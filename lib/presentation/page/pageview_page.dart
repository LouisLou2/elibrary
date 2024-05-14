// import 'package:flutter/material.dart';
//
// class PageViewChangerPage extends StatefulWidget {
//   const PageViewChangerPage({Key? key}) : super(key: key);
//
//   @override
//   _PageViewChangerPageState createState() => _PageViewChangerPageState();
// }
//
// class _PageViewChangerPageState extends State<PageViewChangerPage> {
//   int _indexSegmentSelected = 1;
//   PageController _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("App"),
//         ),
//         body: Container(
//           child: Column(
//             children: [
//               Container(padding: EdgeInsets.all(16), child: buildSegmentedControl()),
//               Expanded(
//                   child: PageView(
//                     controller: _pageController,
//                     onPageChanged: (index) {
//                       changePage(index, animate: false);
//                     },
//                     children: [
//                       buildPage("Page One", index: 0),
//                       buildPage("Page Two", index: 1),
//                       buildPage("Page Three", index: 2),
//                     ],
//                   ))
//             ],
//           ),
//         ));
//   }
//
//   Widget buildPage(String title, {int index = 0}) {
//     return AnimatedPadding(
//       duration: Duration(milliseconds: 500),
//       padding: EdgeInsets.all(_indexSegmentSelected == index ? 0 : 28),
//       child: AnimatedOpacity(
//           duration: Duration(milliseconds: 500),
//           opacity: _indexSegmentSelected == index ? 1 : 0.3,
//           child: Container(
//             margin: EdgeInsets.all(16),
//             decoration: BoxDecoration(color: Colors.pink[200], borderRadius: BorderRadius.circular(16)),
//             child: Center(
//               child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
//             ),
//           )),
//     );
//   }
//
//   Widget buildSegmentedControl() {
//     return Container(
//         padding: EdgeInsets.all(4),
//         decoration: BoxDecoration(color: Colors.pink[50], borderRadius: BorderRadius.circular(16)),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [buildSegmentItem("One", index: 0), buildSegmentItem("Two", index: 1), buildSegmentItem("Three", index: 2)],
//         ));
//   }
//
//   Widget buildSegmentItem(String title, {int index = 0}) {
//     bool selected = _indexSegmentSelected == index;
//     return GestureDetector(
//       onTap: () {
//         changePage(index);
//       },
//       child: Container(
//         decoration: selected ? BoxDecoration(color: Colors.pink[400], borderRadius: BorderRadius.circular(16)) : null,
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//         child: Text(title, style: TextStyle(fontSize: 20, color: selected ? Colors.white : Colors.pink[400])),
//       ),
//     );
//   }
//
//   changePage(int index, {bool animate = true}) async {
//     if (animate) {
//       await _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.decelerate);
//     }
//     setState(() {
//       _indexSegmentSelected = index;
//     });
//   }
// }