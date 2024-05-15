import 'package:elibrary/presentation/widget/costome_image_tile.dart';
import 'package:elibrary/usecase/handler/content_handler.dart';
import 'package:flutter/material.dart';

import '../../../constant/book_const.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('分类'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 14,
          ),
          itemCount: BookConst.category1List.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomImageTile(
              title: BookConst.category1List[index],
              subTitle: '1978本书',
              onTap: () {
                ContentHandler.enterCategoryDetail(cate1: index);
              },
              image: Image.asset(
                BookConst.category1CoverAssets[index],
                fit: BoxFit.cover,
                width: 60,
              ),
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            );
          },
        ),
      ),
    );
  }
}