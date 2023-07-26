import 'package:aj_papers_app/models/subject_model.dart';
import 'package:aj_papers_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/filtered_subjects_controller.dart';
import '../controllers/load_data_controller.dart';
import '../utils/app_texts.dart';
import '../widgets/add_bar_widget.dart';
import '../widgets/app_drawer_widget.dart';
import '../widgets/medium_text_widget.dart';
import '../widgets/subject_tile_widget.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({
    Key? key,
    required this.level,
    required this.subjects,
  }) : super(key: key);

  final RxList<SubjectModel> subjects;

  final String level;

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  final LoadDataController _loadDataController = Get.put(LoadDataController());

  final FilteredSubjectsController _filteredSubjectsController =
      Get.put(FilteredSubjectsController());

  final TextEditingController _searchController = TextEditingController();

  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredSubjectsController.updateFilteredSubjects(widget.subjects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerWidget(),
      appBar: AppBar(
        title: _isSearching
            ? _buildSearchField()
            : Text(
                widget.level,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            icon: _isSearching
                ? const Icon(Icons.close)
                : const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });

              if (!_isSearching) {
                _searchController.clear();
                _filteredSubjectsController
                    .updateFilteredSubjects(widget.subjects);
              }
            },
          ),
          IconButton(
            onPressed: () => Get.toNamed(
              AppText.subjectsBookmarked,
              arguments: widget.level,
            ),
            icon: const Icon(Icons.collections_bookmark_outlined),
          ),
        ],
      ),
      body: Obx(
        () => _filteredSubjectsController.filteredSubjects.isEmpty
            ? const Center(child: Text("No such subject found"))
            : ListView.separated(
                padding: const EdgeInsets.all(20.0),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                itemCount: _filteredSubjectsController.filteredSubjects.length,
                itemBuilder: (context, index) {
                  final subject =
                      _filteredSubjectsController.filteredSubjects[index];

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
                          _filteredSubjectsController.filteredSubjects,
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
                      arguments: [
                        subject.yearlyPapers,
                        widget.level,
                        "${subject.courseName} (${subject.courseCode})",
                      ],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: Colors.white,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        _filteredSubjectsController
            .updateFilteredSubjects(widget.subjects.where((subject) {
          final titleLower = subject.courseName.toLowerCase();
          final courseCode = subject.courseCode.toString();
          final searchLower = value.toLowerCase();

          return titleLower.contains(searchLower) ||
              courseCode.contains(searchLower);
        }).toList());
      },
    );
  }
}
