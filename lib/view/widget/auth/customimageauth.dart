import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class CustomImageAuth extends StatelessWidget {
  const CustomImageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logo,
      height: 100,
      width: double.infinity,
      color: AppColor.secondColor,
    );
  }
}
