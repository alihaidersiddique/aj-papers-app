import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/load_data_controller.dart';
import '../models/subject_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_texts.dart';

class QualificationScreen extends StatelessWidget {
  QualificationScreen({super.key});

  final LoadDataController _loadDataController = Get.put(LoadDataController());

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QualificationWidget(
            icon: AppText.oLogo,
            text: AppText.olevels,
            subjects: _loadDataController.olevels,
          ),
          const SizedBox(height: 20.0),
          QualificationWidget(
            icon: AppText.aLogo,
            text: AppText.alevels,
            subjects: _loadDataController.olevels,
          ),
        ],
      ),
    );
  }
}

class QualificationWidget extends StatelessWidget {
  final String icon;
  final String text;
  final RxList<SubjectModel> subjects;

  const QualificationWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton.icon(
        onPressed: () {
          Get.toNamed(AppText.subjects, arguments: [text, subjects]);
        },
        icon: Image.asset(
          icon,
          height: 40,
        ),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 30.0,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: ElevatedButton.styleFrom(
          splashFactory: InkRipple.splashFactory,
          alignment: Alignment.centerLeft,
          backgroundColor: Colors.white,
          elevation: 4.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
