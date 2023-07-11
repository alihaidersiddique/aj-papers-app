import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart' as root_bundle;

import 'dart:convert';

import '../models/paper_model.dart';
import '../models/subject_model.dart';

class LoadDataController extends GetxController {
  RxList<SubjectModel> olevels = RxList<SubjectModel>([]);

  @override
  void onInit() {
    super.onInit();
    loadOlevelsData();
  }

  Future<void> loadOlevelsData() async {
    final box = await Hive.openBox('myBox');
    if (box.containsKey('myData')) {
      olevels.value = List<SubjectModel>.from(box.get('myData'));
    } else {
      final jsonData = await root_bundle.rootBundle
          .loadString("assets/olevel_subjects.json");
      final data = List<SubjectModel>.from(
          json.decode(jsonData).map((x) => SubjectModel.fromJson(x)));
      olevels.value = data;
      await box.put('myData', data);
    }
    await box.close();
  }

  Future<void> updateBookmarkStatus(
      SubjectModel subject, bool isBookmarked) async {
    final box = await Hive.openBox('myBox');
    final index = olevels.indexOf(subject);
    if (index != -1) {
      final updatedSubject = subject.copyWith(isBookmarked: isBookmarked);
      olevels[index] = updatedSubject;
      await box.put('myData', olevels);
    }
    await box.close();
  }

  void updateFilePath(
      String courseName, String year, String paperName, String filePath) async {
    final box = await Hive.openBox('myBox');
    final data = box.get('myData');
    if (data is List<dynamic>) {
      final subjectModels = data.cast<SubjectModel>();
      for (final subject in subjectModels) {
        if (subject.courseName == courseName) {
          for (final yearlyPaper in subject.yearlyPapers) {
            if (yearlyPaper.year == year) {
              for (int i = 0; i < yearlyPaper.papers.length; i++) {
                if (yearlyPaper.papers[i].name == paperName) {
                  final updatedPaper = PaperModel(
                    course: yearlyPaper.papers[i].course,
                    type: yearlyPaper.papers[i].type,
                    name: yearlyPaper.papers[i].name,
                    paper: yearlyPaper.papers[i].paper,
                    variant: yearlyPaper.papers[i].variant,
                    season: yearlyPaper.papers[i].season,
                    year: yearlyPaper.papers[i].year,
                    link: yearlyPaper.papers[i].link,
                    filePath: filePath,
                  );
                  yearlyPaper.papers[i] = updatedPaper;
                  break;
                }
              }
              break;
            }
          }
          break;
        }
      }
      olevels.value = subjectModels;
      await box.put('myData', subjectModels);
    }
    await box.close();
  }
}
