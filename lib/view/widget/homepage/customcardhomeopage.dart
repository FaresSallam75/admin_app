/* 
import 'package:delivery_app/controller/homepage/homepage_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHomePage extends GetView<HomePageControllerImp> {
  final String titleText;
  final String subTitleText;
  const CustomCardHomePage(
      {super.key, required this.titleText, required this.subTitleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 130,
            decoration: BoxDecoration(
              color: AppColor.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  titleText,
                  style: const TextStyle(
                      fontSize: 18,
                      color: AppColor.backGround,
                      fontWeight: FontWeight.bold),
                ),
              ),
              isThreeLine: true,
              subtitle: Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  subTitleText,
                  style: const TextStyle(
                      fontSize: 23,
                      color: AppColor.backGround,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          )
        ],
      ),
    );
  }
}


/* 
  
  ListTile(
              title: Text(
                titleText,
                style:
                    const TextStyle(fontSize: 16, color: AppColor.backGround),
              ),
              subtitle: Text(
                subTitleText,
                style:
                    const TextStyle(fontSize: 23, color: AppColor.backGround),
              ),
            ),

 */ */