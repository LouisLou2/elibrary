import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/ui_params.dart';

enum RecordType { all, reservation, borrow}

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});
  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  RecordType _calendar = RecordType.all;
  late final SearchController _searchController=SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: Text(
          '我的借阅',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: SearchAnchor(
                searchController: _searchController,
                isFullScreen: true,
                viewBackgroundColor: Theme.of(context).colorScheme.surface,
                viewSurfaceTintColor: Colors.transparent,
                builder: (BuildContext context,SearchController controller){
                  return SearchBar(
                    hintText: '搜索记录',
                    hintStyle: Theme.of(context).textTheme.titleSmall!=null? MaterialStatePropertyAll<TextStyle>(
                      Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ):null,
                    controller: controller,
                    side: MaterialStatePropertyAll<BorderSide>(
                      BorderSide(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                    backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary.withOpacity(0.18)),
                    surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    elevation: const MaterialStatePropertyAll<double>(3.0),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(UIParams.defBorderR),
                      ),
                    ),
                    onTap: (){
                      print('@@@@@@@@@@@@onTap');
                      controller.openView();
                    },
                    onChanged: (_){
                      print('@@@@@@@@@@@@onChanged');
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Change brightness mode',
                        child: IconButton(
                          icon: const Icon(Icons.document_scanner_outlined), onPressed: () {  },
                        ),
                      ),
                    ],
                  );
                },
                suggestionsBuilder: (BuildContext context,SearchController controller){
                  return List<ListTile>.generate(5, (int index){
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: (){
                        controller.closeView(item);
                      },
                    );
                  });
                },
              ),
            ),
            SizedBox(height: UIParams.mediumGap.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: SegmentedButton<RecordType>(
                      segments: <ButtonSegment<RecordType>>[
                        ButtonSegment<RecordType>(
                          value: RecordType.all,
                          label: Text('全部',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          icon: Icon(Icons.all_inbox,
                            size: 20.sp,
                          ),
                        ),
                        ButtonSegment<RecordType>(
                          value: RecordType.reservation,
                          label: Text('预约',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          icon: Icon(Icons.access_time_rounded,
                            size: 20.sp,
                          ),
                        ),
                        ButtonSegment<RecordType>(
                          value: RecordType.borrow,
                          label: Text('借阅',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          icon: Icon(Icons.bookmark_border_rounded,
                            size: 20.sp,
                          ),
                        ),
                      ],
                      selected: <RecordType>{_calendar},
                      onSelectionChanged: (Set<RecordType> newSelection) {
                          setState(() {
                            _calendar = newSelection.first;
                          }
                        );
                      }
                  ),
                ),
              ],
            ),
            Expanded(
              child:PageView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(child:Text('Page One', style: Theme.of(context).textTheme.bodyLarge),),
                  Center(child:Text('Page One', style: Theme.of(context).textTheme.bodyLarge),),
                  Center(child:Text('Page One', style: Theme.of(context).textTheme.bodyLarge),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}