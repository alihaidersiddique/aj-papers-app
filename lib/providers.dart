// import 'package:aj_papers_app/models/subject_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// final olevelsProvider = FutureProvider<List<SubjectModel>>((ref) async {
//   final box = await Hive.openBox('myBox');
//   final data = box.get('myData');
//   await box.close();
//   return List<SubjectModel>.from(data);
// });

// // create a provider which filters the subjects based on isBookmarked
// final filteredSubjectsProvider = Provider<List<SubjectModel>>((ref) {
//   final asyncValue = ref.watch(olevelsProvider);
//   if (asyncValue is AsyncData<List<SubjectModel>>) {
//     final subjects = asyncValue.value;
//     return subjects.where((subject) => subject.isBookmarked == true).toList();
//   } else {
//     return []; // Provide a default value if the asyncValue is not yet resolved or in an error state
//   }
// });

// final checkBookmarkProvider = Provider.family<bool, SubjectModel>((ref, item) {
//   bool found = false;
//   if (item.isBookmarked == true) {
//     found = true;
//   }
//   return found;
// });

// final updateDataProvider =
//     Provider.family<void, SubjectModel>((ref, newData) async {
//   final box = await Hive.openBox('myBox');
//   final data = box.get('myData');
//   final index = data.indexWhere((element) => element.id == newData.id);
//   if (index != -1) {
//     data[index] = newData;
//     await box.put('myData', data);
//   }
//   await box.close();
// });

// final subjectStateProvider = FutureProvider<SubjectStateNotifier>((ref) async {
//   try {
//     final box = await Hive.openBox('myBox');
//     final data = box.get('myData') as List<dynamic>;
//     final subjects = List<SubjectModel>.from(data);
//     final stateNotifier = SubjectStateNotifier(subjects);
//     ref.onDispose(() {
//       box.close();
//     });
//     return stateNotifier;
//   } catch (e) {
//     // Return a default SubjectStateNotifier object in case of an error
//     return SubjectStateNotifier([]);
//   }
// });

// class SubjectStateNotifier extends StateNotifier<List<SubjectModel>> {
//   SubjectStateNotifier(List<SubjectModel> subjects) : super(subjects);

//   void updateSubject(SubjectModel newData) {
//     final index = state.indexWhere((element) => element.id == newData.id);
//     if (index != -1) {
//       state = [...state]; // Create a new list to trigger state update
//       state[index] = newData;
//     }
//   }
// }

