import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      width: 250.0,
      child: ListView(
        children: [
          const Text(
            "AJ Papers",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          ListTile(
            tileColor: AppColors.primaryColor,
            title: const Text(
              'O Levels',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Get.toNamed(AppText.olevels);
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20.0),
          ListTile(
            tileColor: AppColors.primaryColor,
            title: const Text(
              'A Levels',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Get.toNamed(AppText.alevels);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
