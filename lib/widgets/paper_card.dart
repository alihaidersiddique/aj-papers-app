// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:aj_papers_app/models/paper_model.dart';
import 'package:aj_papers_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../controllers/load_data_controller.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PaperCard extends StatefulWidget {
  PaperModel paper;

  PaperCard({
    required this.paper,
    super.key,
  });

  @override
  State<PaperCard> createState() => _PaperCardState();
}

class _PaperCardState extends State<PaperCard> {
  final LoadDataController _loadDataController = Get.find();

  Future<void> openPDF(String url, String fileName) async {
    if (widget.paper.filePath.isEmpty) {
      final filePath = await downloadPDF(url, fileName);
      _loadDataController.updateFilePath(
        widget.paper.course,
        widget.paper.year,
        widget.paper.name,
        filePath,
      );
      Get.toNamed(
        AppText.pdfScreen,
        arguments: filePath,
      );

      setState(() {
        widget.paper = PaperModel(
          course: widget.paper.course,
          type: widget.paper.type,
          name: widget.paper.name,
          paper: widget.paper.paper,
          variant: widget.paper.variant,
          season: widget.paper.season,
          year: widget.paper.year,
          link: widget.paper.link,
          filePath: filePath,
        );
      });
    } else {
      if (await doesFileExist(widget.paper.filePath)) {
        Get.toNamed(
          AppText.pdfScreen,
          arguments: widget.paper.filePath,
        );
      } else {
        final filePath = await downloadPDF(url, fileName);
        _loadDataController.updateFilePath(
          widget.paper.course,
          widget.paper.year,
          widget.paper.name,
          filePath,
        );
        Get.toNamed(
          AppText.pdfScreen,
          arguments: filePath,
        );

        setState(() {
          widget.paper = PaperModel(
            course: widget.paper.course,
            type: widget.paper.type,
            name: widget.paper.name,
            paper: widget.paper.paper,
            variant: widget.paper.variant,
            season: widget.paper.season,
            year: widget.paper.year,
            link: widget.paper.link,
            filePath: filePath,
          );
        });
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
        onTap: () => openPDF(widget.paper.link, widget.paper.name),
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
                '${widget.paper.season} ${widget.paper.year}',
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Text(
              widget.paper.type,
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
                  Text('Paper ${widget.paper.paper}'),
                  Text('Variant ${widget.paper.variant}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
