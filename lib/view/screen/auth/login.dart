import 'package:admin_app/controller/auth/login_controller.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      /*  appBar: AppBar(
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        title: Text(
          "11".tr,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
      ), */
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataReques(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
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
                    CutstomBodyAuth(text: "13".tr),
                    const SizedBox(
                      height: 30,
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
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustoemTextFormAuth(
                        obscuretext: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: true,
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
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "16".tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CustomButtonAuth(
                      text: "17".tr,
                      onBressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomeTextSignUpORSignIn(
                      textOne: "18".tr,
                      textTwo: "19".tr,
                      onTab: () {
                        controller.goToSignUpPage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
