import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomeButtonLanguage extends StatelessWidget {
  final String textButton;
  final Function()? onBressed;
  const CustomeButtonLanguage(
      {super.key, required this.textButton, required this.onBressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        color: AppColor.secondColor,
        textColor: Colors.white,
        onPressed: onBressed,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
