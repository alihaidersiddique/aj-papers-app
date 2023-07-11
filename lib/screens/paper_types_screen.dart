import 'package:aj_papers_app/controllers/load_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../models/paper_model.dart';
import '../utils/app_colors.dart';
import '../widgets/add_bar_widget.dart';
import '../widgets/medium_text_widget.dart';
import '../widgets/paper_card.dart';

class PaperTypesScreen extends ConsumerStatefulWidget {
  const PaperTypesScreen({
    super.key,
    required this.papers,
    required this.level,
    required this.course,
  });

  final List<PaperModel> papers;

  final String level;
  final String course;

  @override
  ConsumerState<PaperTypesScreen> createState() => _OlevelPastpapersState();
}

class _OlevelPastpapersState extends ConsumerState<PaperTypesScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  final LoadDataController _loadDataController = Get.find();

  @override
  void initState() {
    super.initState();
    _loadDataController.loadOlevelsData();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: widget.level,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "\n${widget.course}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // showFilterationBottomSheet(context);
            },
            icon: SvgPicture.asset(
              "assets/icons/filter-new.svg",
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ],
        bottom: AppTabBar(
          preferredHeight: 50,
          tabController: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          buildList(widget.papers, "ALL"),
          buildList(widget.papers, "QP"),
          buildList(widget.papers, "MS"),
          buildList(widget.papers, "ER"),
          buildList(widget.papers, "GT"),
        ],
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }

  Widget buildList(List<PaperModel> subject, String? filterType) {
    List<PaperModel> filteredPapers =
        subject.where((x) => x.type == filterType).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 30.0,
        mainAxisExtent: 120,
      ),
      itemCount: filterType == "ALL" ? subject.length : filteredPapers.length,
      itemBuilder: (BuildContext context, int index) {
        final paper =
            filterType == "ALL" ? subject[index] : filteredPapers[index];
        return PaperCard(paper: paper);
      },
    );
  }
}

class AppTabBar extends ConsumerWidget implements PreferredSizeWidget {
  final double preferredHeight;
  final TabController tabController;

  const AppTabBar({
    Key? key,
    required this.preferredHeight,
    required this.tabController,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: preferredHeight,
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        indicatorColor: const Color(0xffFDD000),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const <Widget>[
          MediumTextWidget(text: "All", color: Colors.black),
          MediumTextWidget(text: "QP", color: Colors.black),
          MediumTextWidget(text: "MS", color: Colors.black),
          MediumTextWidget(text: "ER", color: Colors.black),
          MediumTextWidget(text: "GT", color: Colors.black),
        ],
      ),
    );
  }
}
