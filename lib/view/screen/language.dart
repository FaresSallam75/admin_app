import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/localization/changetranslation.dart';
import 'package:admin_app/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColor.secondColor),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeButtonLanguage(
              textButton: "46".tr,
              onBressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRotes.onBoarding);
              },
            ),
            CustomeButtonLanguage(
              textButton: "47".tr,
              onBressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRotes.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
