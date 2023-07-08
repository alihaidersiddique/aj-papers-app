import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../models/paper_model.dart';
import '../models/yearly_paper_model.dart';
import '../utils/app_texts.dart';
import '../widgets/add_bar_widget.dart';

class PaperYearsScreen extends ConsumerWidget {
  const PaperYearsScreen({
    super.key,
    required this.yearlyPapers,
    required this.level,
  });

  final List<YearlyPaperModel> yearlyPapers;

  final String level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("$level  ( Pastpapers )")),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: yearlyPapers.isEmpty
            ? const Center(
                child: Text("No papers available right now"),
              )
            : ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                itemCount: yearlyPapers.length,
                itemBuilder: (context, index) {
                  final subject = yearlyPapers[index];

                  return PaperYearWidget(
                    icon: const Icon(
                      Icons.folder,
                      color: Colors.grey,
                    ),
                    title: Text(
                      subject.year,
                      style: const TextStyle(fontSize: 22.0),
                    ),
                    onTap: () {
                      try {
                        List<PaperModel> lists = [];
                        subject.papers.map((e) => lists.add(e)).toList();
                        Get.toNamed(AppText.paperTypes,
                            arguments: [lists, level]);
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
}

class PaperYearWidget extends StatelessWidget {
  const PaperYearWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Icon icon;
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
          leading: icon,
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
