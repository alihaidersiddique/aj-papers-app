import 'package:aj_papers_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class PDFScreen extends StatelessWidget {
  final String filePath;
  final String fileName;

  const PDFScreen({
    Key? key,
    required this.filePath,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("file path of PDF Viewer: $filePath");
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
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
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () => Get.back(),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
