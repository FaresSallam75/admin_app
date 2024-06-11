import 'package:admin_app/controller/onboarding_controller.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/data/datasourse/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBordingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 4, top: 15),
              width: controller.currentValue == index ? 20 : 7,
              height: 7,
              duration: const Duration(milliseconds: 900),
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
