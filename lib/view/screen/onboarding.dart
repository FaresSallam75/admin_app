
import 'package:admin_app/controller/onboarding_controller.dart';
import 'package:admin_app/view/widget/onboarding/custombutton.dart';
import 'package:admin_app/view/widget/onboarding/dotcontroller.dart';
import 'package:admin_app/view/widget/onboarding/pageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageViewOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DotControllerOnBoarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
