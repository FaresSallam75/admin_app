import 'package:admin_app/controller/onboarding_controller.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/data/datasourse/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewOnBoarding extends GetView<OnBoardingControllerImp> {
  const PageViewOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.nextPageChanged(value);
      },
      itemCount: onBordingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Container(height: 25),
          Text(onBordingList[index].title!,
              style: Theme.of(context).textTheme.titleLarge),
          Container(
            height: 80,
          ),
          Image.asset(
            onBordingList[index].image!,
            width: 200,
            height: 230,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBordingList[index].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 1.3,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
