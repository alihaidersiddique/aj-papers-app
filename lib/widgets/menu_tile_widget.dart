import 'package:aj_papers_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
            leading: Icon(icon, color: AppColors.primaryColor),
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
