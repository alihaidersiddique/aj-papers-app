// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import 'package:aj_papers_app/models/yearly_paper_model.dart';

import '../utils/app_colors.dart';
import '../utils/app_texts.dart';
import '../widgets/add_bar_widget.dart';
import '../widgets/menu_tile_widget.dart';

class PaperItemsScreen extends ConsumerWidget {
  const PaperItemsScreen({
    super.key,
    required this.yearlyPapers,
    required this.level,
    required this.course,
  });

  final List<YearlyPaperModel> yearlyPapers;
  final String level;
  final String course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: level,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "\n$course",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          MenuTileWidget(
            title: "Pastpapers",
            icon: Icons.document_scanner,
            onTap: () {
              Get.toNamed(
                AppText.paperYears,
                arguments: [yearlyPapers, level, course],
              );
            },
          ),
          MenuTileWidget(
            title: "Lectures",
            icon: Icons.video_collection,
            onTap: () {
              Get.toNamed(
                AppText.lectures,
                arguments: [level, course],
              );
            },
          ),
          MenuTileWidget(
            title: "Notes",
            icon: Icons.notes,
            onTap: () {
              Get.toNamed(
                AppText.notes,
                arguments: [level, course],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}
