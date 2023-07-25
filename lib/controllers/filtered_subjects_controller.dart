import 'package:get/get.dart';

import '../models/subject_model.dart';

class FilteredSubjectsController extends GetxController {
  RxList<SubjectModel> filteredSubjects = RxList<SubjectModel>();

  void updateFilteredSubjects(List<SubjectModel> subjects) {
    filteredSubjects.assignAll(subjects);
  }
}
