import 'package:admin_app/controller/homepage/homepage_controller.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/constant/imageasset.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/view/widget/homepage/customcardhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text("204".tr),
        //  backgroundColor: AppColor.backGround,
      ),
      /* floatingActionButton: GetBuilder<HomePageControllerImp>(
        builder: (controller) => AdvancedSwitch(
          onChanged: (value) {
            if (controller.myServices.sharedPref.getString("lang") == "ar") {
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
                  ? Text("120".tr)
                  : Text("121".tr),
          inactiveChild:
              controller.myServices.sharedPref.getString("lang") == "en"
                  ? Text("121".tr)
                  : Text("120".tr),
          borderRadius: const BorderRadius.all(Radius.circular(1000)),
          width: 120.0,
          height: 45.0,
          enabled: true,

          disabledOpacity: 0.5,
        ),
      ), */
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          const SizedBox(height: 10),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 150),
            children: [
              CustomAdminHome(
                  onTap: () {
                    Get.toNamed(AppRotes.viewcategories);
                  },
                  title: "60".tr,
                  image: AppImageAsset.categories),
              CustomAdminHome(
                onTap: () {
                  Get.toNamed(AppRotes.viewItems);
                },
                title: "167".tr,
                image: AppImageAsset.items,
              ),
              CustomAdminHome(
                  onTap: () {
                    Get.toNamed(AppRotes.ordersHome);
                  },
                  title: "111".tr,
                  image: AppImageAsset.orders),
              CustomAdminHome(
                  onTap: () {
                    Get.toNamed(AppRotes.notifications);
                  },
                  title: "101".tr,
                  image: AppImageAsset.notification),
              CustomAdminHome(
                  onTap: () {
                    Get.toNamed(AppRotes.viewCoupons);
                  },
                  title: "114".tr,
                  image: AppImageAsset.coupon),
              /*  CustomAdminHome(
                  onTap: () {}, title: "Users", image: AppImageAsset.users), */
              CustomAdminHome(
                  onTap: () {
                    Get.toNamed(AppRotes.deliveryPage);
                  },
                  title: "85".tr,
                  image: AppImageAsset.deliveryman),
              /*  CustomAdminHome(
                  onTap: () {},
                  title: "Messages",
                  image: AppImageAsset.message), */
              /*   CustomAdminHome(
                  onTap: () {}, title: "Reports", image: AppImageAsset.report), */
              CustomAdminHome(
                  onTap: () {
                    Get.toNamed(AppRotes.settingPage);
                  },
                  title: "65".tr,
                  image: AppImageAsset.setting),
            ],
          ),
        ],
      ),
    );
  }
}
