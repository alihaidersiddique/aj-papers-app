import 'package:flutter/material.dart';

import '../widgets/add_bar_widget.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({
    super.key,
    required this.level,
  });

  final String level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$level  ( Notes )")),
      body: const Center(
        child: Text(
          'Notes',
          style: TextStyle(fontSize: 30),
        ),
      ),
      bottomNavigationBar: const AddBarWidget(),
    );
  }
}
