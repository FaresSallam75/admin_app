import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTitleHomePage extends StatelessWidget {
  final String title;
  const CustomTitleHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            color: AppColor.secondColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
