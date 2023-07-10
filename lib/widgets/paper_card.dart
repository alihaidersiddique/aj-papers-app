import 'dart:convert';
import 'dart:io';

import 'package:aj_papers_app/models/paper_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:get/get.dart';

import '../controllers/load_data_controller.dart';
import '../utils/app_colors.dart';

class PaperCard extends StatefulWidget {
  PaperCard({
    required this.paper,
    super.key,
  });

  PaperModel paper;

  @override
  State<PaperCard> createState() => _PaperCardState();
}

class _PaperCardState extends State<PaperCard> {
  final LoadDataController _loadDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint("checking that filePath is not null");
    debugPrint(widget.paper.toJson().toString());
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          _loadDataController.updateFilePath(
            widget.paper.course,
            widget.paper.year,
            widget.paper.name,
            widget.paper.name,
          );

          setState(() {
            widget.paper = PaperModel(
              course: widget.paper.course,
              year: widget.paper.year,
              name: widget.paper.name,
              paper: widget.paper.paper,
              season: widget.paper.season,
              type: widget.paper.type,
              variant: widget.paper.variant,
              link: widget.paper.link,
              filePath: widget.paper.name,
            );
          });
        },
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

  void saveFilePathToJson(
      String filePath, String course, String year, String name) async {
    final jsonString =
        await root_bundle.rootBundle.loadString('assets/olevel_subjects.json');
    final jsonData = jsonDecode(jsonString);
    final yearlyPapers =
        jsonData.firstWhere((c) => c['courseName'] == course)['yearlyPapers'];
    final papers = yearlyPapers.firstWhere((p) => p['year'] == year)['papers'];
    final paper = papers.firstWhere((p) => p['name'] == name);
    paper['filePath'] = filePath;
    final updatedJsonString = jsonEncode(jsonData);
    final newFile =
        await root_bundle.rootBundle.loadString('assets/olevel_subjects.json');
    final file = File(newFile);
    await file.writeAsString(updatedJsonString);
  }

  // Future<String> downloadFile(String fileUrl, String fileName) async {
  Future<bool> doesFileExist(String filePath) async {
    final file = File(filePath);
    return file.existsSync();
  }
}
