// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import 'package:aj_papers_app/models/yearly_paper_model.dart';

import '../utils/app_texts.dart';
import '../widgets/add_bar_widget.dart';

class PaperItemsScreen extends ConsumerWidget {
  const PaperItemsScreen(
      {super.key, required this.yearlyPapers, required this.level});

  final List<YearlyPaperModel> yearlyPapers;
  final String level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(level)),
      body: Column(
        children: [
          MenuTileWidget(
            title: "Pastpapers",
            icon: Icons.document_scanner,
            onTap: () {
              Get.toNamed(
                AppText.paperYears,
                arguments: [yearlyPapers, level],
              );
            },
          ),
          MenuTileWidget(
            title: "Lectures",
            icon: Icons.video_collection,
            onTap: () {
              Get.toNamed(
                AppText.lectures,
                arguments: level,
              );
            },
          ),
          MenuTileWidget(
            title: "Notes",
            icon: Icons.notes,
            onTap: () {
              Get.toNamed(
                AppText.notes,
                arguments: level,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}

class MenuTileWidget extends StatelessWidget {
  const MenuTileWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: const TextStyle(fontSize: 22.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
          ),
        ),
      ),
    );
  }
}
