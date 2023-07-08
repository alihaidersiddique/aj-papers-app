import 'package:flutter/material.dart';

import '../widgets/add_bar_widget.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({
    super.key,
    required this.level,
  });

  final String level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$level  ( Lectures )")),
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
