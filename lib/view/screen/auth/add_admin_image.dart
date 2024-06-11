import 'package:admin_app/controller/auth/signup_controller.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAdminImage extends StatelessWidget {
  const AddAdminImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround.withOpacity(0.5),
      body: GetBuilder<SigupControllerImp>(
        builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.secondColor,
                  ),
                ),
              ),
              Container(
                child: Text("205".tr,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              Stack(
                children: [
                  controller.file == null
                      ? Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: CircleAvatar(
                            backgroundImage:
                                const AssetImage("assets/images/user80.png"),
                            // backgroundColor: Colors.grey.shade300,
                            radius: 150,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  bottom: 25,
                                  right: 40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColor.black,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        controller.chooseImageOption();
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColor.backGround,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: CircleAvatar(
                            radius: 150,
                            backgroundImage: FileImage(controller.file!),
                          ),
                        ),
                  if (controller.isLoading == true)
                    const Positioned(
                      top: 0.0,
                      bottom: 0.0,
                      right: 0.3,
                      left: 0.3,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.secondColor,
                        ),
                      ),
                    ),
                ],
              ),
              const Spacer(),
              /* CustomButtonAuth(
                text: "Sign Up",
                onBressed: () {
                  controller.signUp();
                },
              ), */
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                minWidth: Get.width - 80,
                height: 50,
                color: AppColor.secondColor,
                textColor: AppColor.backGround,
                onPressed: () {
                  controller.signUp();
                },
                child: Text(
                  "19".tr,
                  style: const TextStyle(fontSize: 16, fontFamily: "sans"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
