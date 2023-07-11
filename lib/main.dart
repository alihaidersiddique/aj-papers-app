import 'package:aj_papers_app/models/subject_model.dart';
import 'package:aj_papers_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/paper_model.dart';
import 'models/yearly_paper_model.dart';
import 'theme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SubjectModelAdapter());
  Hive.registerAdapter(PaperModelAdapter());
  Hive.registerAdapter(YearlyPaperModelAdapter());
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      getPages: appRoutes,
      initialRoute: '/',
      defaultTransition: Transition.fadeIn,
      builder: EasyLoading.init(),
    );
  }
}
