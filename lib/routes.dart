import 'package:aj_papers_app/screens/lectures_screen.dart';
import 'package:get/route_manager.dart';

import 'screens/bookmarks_screen.dart';
import 'screens/notes_screen.dart';
import 'screens/paper_items_screen.dart';
import 'screens/paper_years_screen.dart';
import 'screens/pdf_screen.dart';
import 'screens/subjects_screen.dart';
import 'screens/paper_types_screen.dart';
import 'screens/qualifications_screen.dart';
import 'utils/app_texts.dart';

final appRoutes = [
  GetPage(
    name: '/',
    page: () => QualificationScreen(),
  ),
  GetPage(
    name: AppText.subjects,
    page: () => SubjectsScreen(
      level: Get.arguments[0],
      subjects: Get.arguments[1],
    ),
  ),
  GetPage(
    name: AppText.paperItems,
    page: () => PaperItemsScreen(
      yearlyPapers: Get.arguments[0],
      level: Get.arguments[1],
    ),
  ),
  GetPage(
    name: AppText.paperYears,
    page: () => PaperYearsScreen(
      yearlyPapers: Get.arguments[0],
      level: Get.arguments[1],
    ),
  ),
  GetPage(
    name: AppText.paperTypes,
    page: () => PaperTypesScreen(
      papers: Get.arguments[0],
      level: Get.arguments[1],
    ),
  ),
  GetPage(
    name: AppText.subjectsBookmarked,
    page: () => BookmarksScreen(),
  ),
  GetPage(
    name: AppText.pdfScreen,
    page: () => PDFScreen(filePath: Get.arguments),
  ),
  GetPage(
    name: AppText.lectures,
    page: () => LecturesScreen(level: Get.arguments),
  ),
  GetPage(
    name: AppText.notes,
    page: () => NotesScreen(level: Get.arguments),
  ),
  // GetPage(
  //   name: AppText.pdfDownloader,
  //   page: () => PdfDownloader(paper: Get.arguments),
  // ),
];
