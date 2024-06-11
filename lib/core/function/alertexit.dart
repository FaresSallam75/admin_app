import 'dart:io';
import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Watchout",
      middleText: "Do You Want Exit From App",
      actions: [
        MaterialButton(
          color: AppColor.orange,
          textColor: AppColor.backGround,
          onPressed: () {
            exit(0);
          },
          child: const Text("Confirm"),
        ),
        MaterialButton(
          color: AppColor.orange,
          textColor: AppColor.backGround,
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel"),
        ),
      ]);
  return Future.value(true);
}
