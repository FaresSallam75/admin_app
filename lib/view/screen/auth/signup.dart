import 'package:admin_app/controller/auth/signup_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/function/alertexit.dart';
import 'package:admin_app/core/function/validinput.dart';
import 'package:admin_app/view/widget/auth/custombodyauth.dart';
import 'package:admin_app/view/widget/auth/custombuttonauth.dart';
import 'package:admin_app/view/widget/auth/customimageauth.dart';
import 'package:admin_app/view/widget/auth/customtexttitleaith.dart';
import 'package:admin_app/view/widget/auth/custtextformfield.dart';
import 'package:admin_app/view/widget/auth/signinauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SigupControllerImp());
    return Scaffold(
      /*   appBar: AppBar(
        title: Text(
          "19".tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ), */
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SigupControllerImp>(
            builder: (controller) => HandlingDataReques(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 30),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          const CustomImageAuth(),
                          const SizedBox(height: 20.0),
                          CustomTextTitlleAuth(text: "12".tr),
                          const SizedBox(
                            height: 15,
                          ),
                          CutstomBodyAuth(text: "26".tr),
                          const SizedBox(
                            height: 30,
                          ),
                          CustoemTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 100, "20".tr);
                            },
                            labl: "20".tr,
                            hinText: "25".tr,
                            iconData: Icons.person_outline,
                            myController: controller.username,
                          ),
                          CustoemTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 100, "21".tr);
                            },
                            labl: "21".tr,
                            hinText: "14".tr,
                            iconData: Icons.email_outlined,
                            myController: controller.email,
                          ),
                          CustoemTextFormAuth(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 11, 15, "22".tr);
                            },
                            labl: "22".tr,
                            hinText: "24".tr,
                            iconData: Icons.phone,
                            myController: controller.phone,
                          ),
                          GetBuilder<SigupControllerImp>(
                            builder: (controller) => CustoemTextFormAuth(
                              obscuretext: controller.isShowPassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 4, 50, "23".tr);
                              },
                              labl: "23".tr,
                              hinText: "15".tr,
                              iconData: Icons.lock_outline,
                              myController: controller.password,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomButtonAuth(
                            text: "Continue", // "19".tr,
                            onBressed: () {
                              controller.goToImagePage();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomeTextSignUpORSignIn(
                            textOne: "27".tr,
                            textTwo: "17".tr,
                            onTab: () {
                              controller.goToSigninPage();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
