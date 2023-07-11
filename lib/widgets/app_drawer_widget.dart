import 'package:aj_papers_app/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/load_data_controller.dart';
import '../utils/app_colors.dart';

class AppDrawerWidget extends StatelessWidget {
  AppDrawerWidget({super.key});

  final LoadDataController _loadDataController = Get.put(LoadDataController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 200.0,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
            child: const Center(
              child: Text(
                "AJ Papers",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          DrawerMenuWidget(
            icon: Icons.school,
            title: AppText.olevels,
            onPress: () {
              final subjects = _loadDataController.olevels;
              Get.toNamed(AppText.subjects, arguments: ["O LEVELS", subjects]);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          DrawerMenuWidget(
            icon: Icons.school,
            title: AppText.alevels,
            onPress: () {
              final subjects = _loadDataController.olevels;
              Get.toNamed(AppText.subjects, arguments: ["A LEVELS", subjects]);
              Navigator.pop(context);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
  });

  final IconData icon;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primaryColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
      onTap: onPress,
    );
  }
}
