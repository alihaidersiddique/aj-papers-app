import 'dart:io';

import 'package:aj_papers_app/models/paper_model.dart';
import 'package:aj_papers_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../controllers/load_data_controller.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PaperCard extends StatelessWidget {
  final PaperModel paper;

  PaperCard({
    required this.paper,
    super.key,
  });

  final LoadDataController _loadDataController = Get.find();

  Future<void> openPDF(String url, String fileName) async {
    if (paper.filePath.isEmpty) {
      final filePath = await downloadPDF(url, fileName);
      _loadDataController.updateFilePath(
        paper.course,
        paper.year,
        paper.name,
        filePath,
      );
      Get.toNamed(
        AppText.pdfScreen,
        arguments: filePath,
      );
    } else {
      if (await doesFileExist(paper.filePath)) {
        Get.toNamed(
          AppText.pdfScreen,
          arguments: paper.filePath,
        );
      } else {
        final filePath = await downloadPDF(url, fileName);
        _loadDataController.updateFilePath(
          paper.course,
          paper.year,
          paper.name,
          filePath,
        );
        Get.toNamed(
          AppText.pdfScreen,
          arguments: filePath,
        );
      }
    }
  }

  Future<String> downloadPDF(String url, String fileName) async {
    EasyLoading.show(status: 'Downloading file...');

    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final appDir = await getApplicationDocumentsDirectory();
    final file = File('${appDir.path}/$fileName');
    await file.writeAsBytes(bytes);

    EasyLoading.dismiss();
    return file.path;
  }

  Future<bool> doesFileExist(String filePath) async {
    final file = File(filePath);
    return await file.exists();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () => openPDF(paper.link, paper.name),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppColors.primaryColor,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Text(
                '${paper.season} ${paper.year}',
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Text(
              paper.type,
              textScaleFactor: 2.0,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Paper ${paper.paper}'),
                  Text('Variant ${paper.variant}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
