import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/add_bar_widget.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({
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
          'Lectures',
          style: TextStyle(fontSize: 30),
        ),
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}
