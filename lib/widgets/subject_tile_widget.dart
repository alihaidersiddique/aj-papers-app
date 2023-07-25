import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import 'medium_text_widget.dart';

class SubjectTileWidget extends StatelessWidget {
  const SubjectTileWidget({
    super.key,
    required this.courseCode,
    required this.courseName,
    required this.bookmarkIcon,
    required this.onTap,
  });

  final MediumTextWidget courseCode;
  final MediumTextWidget courseName;
  final Widget bookmarkIcon;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // course code
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  courseCode,
                  bookmarkIcon,
                ],
              ),
            ),
            // course name
            Container(
              color: AppColors.primaryColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              alignment: Alignment.centerLeft,
              child: courseName,
            ),
          ],
        ),
      ),
    );
  }
}
