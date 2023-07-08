import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppTheme.appBarTheme,
  textTheme: AppTheme.appTextTheme,
  iconButtonTheme: AppTheme.appIconButtonTheme,
  iconTheme: AppTheme.appIconTheme,
);

class AppTheme {
  static const appBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  );

  static var appTextTheme = const TextTheme(
    titleMedium: TextStyle(fontSize: 22.0),
    titleSmall: TextStyle(),
  );

  static var appIconButtonTheme = const IconButtonThemeData(
    style: ButtonStyle(
      iconSize: MaterialStatePropertyAll(26),
      iconColor: MaterialStatePropertyAll(Colors.white),
    ),
  );

  static var appIconTheme = const IconThemeData(
    color: Color(0xffFDD000),
    size: 26,
  );
}
