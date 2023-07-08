import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatelessWidget {
  final String filePath;

  const PDFScreen({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("file path of PDF Viewer: $filePath");
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: filePath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (pages) {
          debugPrint('PDF document loaded');
        },
        onError: (error) {
          debugPrint('Error occurred: $error');
        },
        onPageError: (page, error) {
          debugPrint('Error occurred on page $page: $error');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          // do something when the PDF view is created
        },
        onPageChanged: (int? page, int? total) {
          debugPrint('page change: $page/$total');
        },
      ),
    );
  }
}
