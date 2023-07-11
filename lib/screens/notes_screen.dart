import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/add_bar_widget.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({
    super.key,
    required this.level,
    required this.course,
  });

  final String level;
  final String course;

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Text(
          'Notes',
          style: TextStyle(fontSize: 30),
        ),
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}
