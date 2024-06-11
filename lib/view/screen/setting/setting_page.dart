import 'package:admin_app/controller/setting/setting_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: Text("65".tr),
      ),
      body: GetBuilder<SettingController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.adminList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      const SizedBox(height: 20),
                      "${AppLink.imageAdmin}/${controller.adminList[index].adminImage}" ==
                              ""
                          ? CircleAvatar(
                              radius: 150,
                              backgroundImage: NetworkImage(
                                  "${AppLink.imageAdmin}/${controller.adminList[index].adminImage}"))
                          : const CircleAvatar(
                              radius: 150,
                              backgroundImage:
                                  AssetImage("assets/images/user80.png")),
                      const SizedBox(height: 30),
                      Text(
                        "${controller.adminList[index].adminName}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 18.0),
                      ),
                      Text(
                        "${controller.adminList[index].adminEmail}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AdvancedSwitch(
                  onChanged: (value) {
                    if (controller.myServices.sharedPref.getString("lang") ==
                        "ar") {
                      controller.changeLanguage("en");
                    } else {
                      controller.changeLanguage("ar");
                    }
                  },

                  controller: controller.switcherController,
                  // activeImage: const AssetImage('assets/day_sky.png'),
                  // inactiveImage: const AssetImage('assets/night_sky.jpg'),
                  activeColor: AppColor.secondColor,
                  inactiveColor: AppColor.secondColor,
                  activeChild:
                      controller.myServices.sharedPref.getString("lang") == "ar"
                          ? Text("120".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColor.backGround))
                          : Text("121".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColor.backGround)),
                  inactiveChild:
                      controller.myServices.sharedPref.getString("lang") == "en"
                          ? Text("121".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColor.backGround))
                          : Text("120".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColor.backGround)),
                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                  width: 120.0,
                  height: 45.0,
                  enabled: true,

                  disabledOpacity: 0.5,
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    //controller.myServices.sharedPref.clear();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: AppColor.secondColor,
                    child: ListTile(
                      onTap: () {
                        controller.logout();
                      },
                      title: Text("203".tr,
                          style: TextStyle(color: AppColor.backGround)),
                      trailing:
                          const Icon(Icons.logout, color: AppColor.backGround),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
