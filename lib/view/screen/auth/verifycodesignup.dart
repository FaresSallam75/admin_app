import 'package:admin_app/controller/auth/verifycodesignup_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/view/widget/auth/custombodyauth.dart';
import 'package:admin_app/view/widget/auth/customtexttitleaith.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("41".tr, style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataReques(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                CustomTextTitlleAuth(text: "42".tr),
                const SizedBox(
                  height: 15,
                ),
                CutstomBodyAuth(text: "${"43".tr} ${controller.email}"), //43
                const SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  keyboardType: TextInputType.number,

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
                    controller.checkCode(code);
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verifyCode) {
                    controller.goToSuccessSignUp(verifyCode);
                  }, // end onSubmit
                ),

                const SizedBox(height: 20),
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
