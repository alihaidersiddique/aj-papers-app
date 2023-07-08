import 'package:aj_papers_app/controllers/load_data_controller.dart';
import 'package:aj_papers_app/utils/app_texts.dart';
import 'package:aj_papers_app/widgets/medium_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../widgets/add_bar_widget.dart';
import '../widgets/subject_tile_widget.dart';

class BookmarksScreen extends StatelessWidget {
  BookmarksScreen({super.key});

  final LoadDataController _loadDataController = Get.put(LoadDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
      ),
      body: Obx(
        () {
          final subjects = _loadDataController.olevels
              .where((subject) => subject.isBookmarked == true)
              .toList();

          if (subjects.isEmpty) {
            return const Center(
              child: Text("No Bookmarks"),
            );
          } else {
            return ListView.separated(
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
                    arguments: subject.yearlyPapers,
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}
