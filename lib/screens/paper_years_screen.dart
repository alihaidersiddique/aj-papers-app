import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../models/paper_model.dart';
import '../models/yearly_paper_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_texts.dart';
import '../widgets/add_bar_widget.dart';

class PaperYearsScreen extends StatefulWidget {
  const PaperYearsScreen({
    super.key,
    required this.yearlyPapers,
    required this.level,
    required this.course,
  });

  final List<YearlyPaperModel> yearlyPapers;

  final String level;
  final String course;

  @override
  State<PaperYearsScreen> createState() => _PaperYearsScreenState();
}

class _PaperYearsScreenState extends State<PaperYearsScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _isSearching = false;

  List<YearlyPaperModel> yearlyPapers = [];

  @override
  void initState() {
    super.initState();
    yearlyPapers = widget.yearlyPapers.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? _buildSearchField()
            : Text.rich(
                TextSpan(
                  text: widget.level,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\n${widget.course}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
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
                if (!_isSearching) {
                  _searchController.clear();
                  yearlyPapers = widget.yearlyPapers.toList();
                }
              });
            },
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: widget.yearlyPapers.isEmpty
            ? const Center(
                child: Text("No papers available right now"),
              )
            : ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                itemCount: yearlyPapers.length,
                itemBuilder: (context, index) {
                  final subject = yearlyPapers[index];

                  return PaperYearWidget(
                    title: Text(
                      subject.year,
                      style: const TextStyle(fontSize: 22.0),
                    ),
                    onTap: () {
                      try {
                        List<PaperModel> lists = [];
                        subject.papers.map((e) => lists.add(e)).toList();
                        Get.toNamed(
                          AppText.paperTypes,
                          arguments: [lists, widget.level, widget.course],
                        );
                      } catch (e) {
                        debugPrint('finding bug');
                        debugPrint(e.toString());
                      }
                    },
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
      keyboardType: TextInputType.number,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        setState(() {
          yearlyPapers = widget.yearlyPapers.where((subject) {
            final search = subject.year;
            final searchLower = value.toLowerCase();

            return search.contains(searchLower);
          }).toList();
        });
      },
    );
  }
}

class PaperYearWidget extends StatelessWidget {
  const PaperYearWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final Text title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: const Icon(
            Icons.folder_outlined,
            color: AppColors.primaryColor,
          ),
          title: title,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
