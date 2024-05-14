import 'package:elibrary/state_management/prov/content_prov.dart';
import 'package:elibrary/state_management/prov_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EbookPreviewPage extends StatefulWidget {
  const EbookPreviewPage({super.key});
  @override
  State<EbookPreviewPage> createState() => _FilePreviewPageState();
}
class _FilePreviewPageState extends State<EbookPreviewPage> {
  final ContentProv _cprov= ProvManager.contentProv;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('书籍试读'),
          actions: const [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.print),
              onPressed: null,
            ),
          ],
        ),
        body: SfPdfViewer.network(_cprov.currentDetailBook.bookInfo.ebook_url!),
    );
  }
}