import 'package:flutter/material.dart';

class AddBarWidget extends StatelessWidget {
  const AddBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.white),
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        "Advertisement",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
        ),
      ),
    );
  }
}
