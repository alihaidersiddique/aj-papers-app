import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void showCircularProgressIndicator() {
  Get.dialog(
    const Center(
      child: CircularProgressIndicator(color: Colors.white),
    ),
  );
}

void showSnackBar(String text) {
  Get.showSnackbar(
    GetSnackBar(
      message: text,
      duration: const Duration(milliseconds: 1500),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0, // Inner padding for SnackBar content.
        vertical: 15.0,
      ),
    ),
  );
}
