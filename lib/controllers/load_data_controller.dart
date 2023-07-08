import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/services.dart' as root_bundle;

import 'dart:convert';

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
}
