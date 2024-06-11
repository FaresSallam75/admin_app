import 'package:admin_app/controller/forgetpassword/verifycode_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/view/widget/auth/custombodyauth.dart';
import 'package:admin_app/view/widget/auth/customtexttitleaith.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("41".tr, style: Theme.of(context).textTheme.titleLarge),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) => HandlingDataReques(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                CustomTextTitlleAuth(text: "42".tr),
                const SizedBox(height: 15),
                CutstomBodyAuth(text: "${"43".tr} ${controller.email}"),
                const SizedBox(height: 30),
                OtpTextField(
                  //cursorColor: Colors.redAccent,
                  enabledBorderColor: AppColor.orange,
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(15.0),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verifyCode) {
                    controller!.goToResetPassword(verifyCode);
                  }, // end onSubmit
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    controller.resendCode();
                  },
                  child: Center(
                    child: Text("206".tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColor.secondColor)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
