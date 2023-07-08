import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;

import '../utils/app_colors.dart';

class PaperCard extends StatelessWidget {
  const PaperCard({
    required this.course,
    required this.type,
    required this.name,
    required this.paper,
    required this.link,
    required this.season,
    required this.year,
    required this.variant,
    required this.filePath,
    super.key,
  });

  final String course;
  final String type;
  final String name;
  final String paper;
  final String link;
  final String season;
  final String year;
  final String variant;
  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {},
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
                '$season $year',
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Text(
              type,
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
                  Text('Paper $paper'),
                  Text('Variant $variant'),
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
