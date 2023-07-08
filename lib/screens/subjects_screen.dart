import 'package:aj_papers_app/models/subject_model.dart';
import 'package:aj_papers_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/load_data_controller.dart';
import '../utils/app_texts.dart';
import '../widgets/add_bar_widget.dart';
import '../widgets/app_drawer_widget.dart';
import '../widgets/medium_text_widget.dart';
import '../widgets/subject_tile_widget.dart';

class SubjectsScreen extends StatelessWidget {
  SubjectsScreen({
    Key? key,
    required this.level,
    required this.subjects,
  }) : super(key: key);

  final RxList<SubjectModel> subjects;

  final LoadDataController _loadDataController = Get.put(LoadDataController());

  final String level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawerWidget(),
      appBar: AppBar(
        title: Text(level),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppText.subjectsBookmarked),
            icon: const Icon(Icons.collections_bookmark_outlined),
          ),
        ],
      ),
      body: Obx(
        () => subjects.isEmpty
            ? const Center(
                child: Text("No subjects"),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(20.0),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  return SubjectTileWidget(
                    courseCode:
                        MediumTextWidget(text: subject.courseCode.toString()),
                    courseName: MediumTextWidget(
                      text: subject.courseName,
                      color: Colors.white,
                    ),
                    bookmarkIcon: IconButton(
                      onPressed: () {
                        _loadDataController.updateBookmarkStatus(
                          subject,
                          !subject.isBookmarked,
                        );
                      },
                      icon: Icon(
                        subject.isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onTap: () => Get.toNamed(
                      AppText.paperItems,
                      arguments: [subject.yearlyPapers, level],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}
