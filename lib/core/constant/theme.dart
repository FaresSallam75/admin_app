import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    iconTheme: const IconThemeData(color: AppColor.secondColor),
    titleTextStyle: const TextStyle(
      color: AppColor.secondColor,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: "sans",
    ), // Cairo

    backgroundColor: Colors.grey.shade50,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.secondColor),
  fontFamily: "sans",
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.secondColor),
    headlineLarge: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.black),
    headlineMedium: TextStyle(
        fontSize: 20, color: AppColor.secondColor, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 17, color: AppColor.black, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      height: 1.5,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(color: AppColor.black, fontSize: 17),
    bodySmall: TextStyle(color: AppColor.grey, fontSize: 15),
  ),
);

ThemeData themeArabic = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    iconTheme: const IconThemeData(color: AppColor.secondColor),
    titleTextStyle: const TextStyle(
      color: AppColor.secondColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Cairo",
    ), // Cairo

    backgroundColor: Colors.grey.shade50,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.secondColor,
  ),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.secondColor),
    headlineLarge: TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, color: AppColor.black),
    headlineMedium: TextStyle(fontSize: 20, color: AppColor.secondColor),
    headlineSmall: TextStyle(
        fontSize: 17, color: AppColor.black, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      height: 1.5,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(color: AppColor.grey, fontSize: 15),
  ),
);
