import 'package:admin_app/controller/notifications/notifications_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("101".tr),
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 5,
                ),
                ...List.generate(controller.data.length, (index) {
                  String dateString =
                      controller.data[index]['notifications_datetime'];
                  DateTime date = DateTime.parse(dateString);
                  var formatter = DateFormat.yMMMMd('ar');
                  String formattedDate = formatter.format(date);

                  String title = "Success";
                  String titleVerify = "Verify OTP";
                  String titleVerifyMessage =
                      "this Verifycode 77438 to Complete Create your Profile.";

                  String one = "Your Order Waiting For Approved";
                  String two = "Your Order has been Prepare";
                  String three = "Your Order is On The Way ";
                  String four = "Your Order Has Been Delivered";
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Text(
                              "${controller.data[index]['notifications_title'] == title ? "${34}".tr : controller.data[index]['notifications_title'] == titleVerify ? "${106}".tr : controller.data[index]['notifications_title']}"),
                          subtitle: Text(controller.data[index]
                                      ['notifications_body'] ==
                                  one
                              ? "${102}".tr
                              : controller.data[index]['notifications_body'] ==
                                      two
                                  ? "${103}".tr
                                  : controller.data[index]
                                              ['notifications_body'] ==
                                          three
                                      ? "${104}".tr
                                      : controller.data[index]
                                                  ['notifications_body'] ==
                                              four
                                          ? "${105}".tr
                                          : controller.data[index]
                                                      ['notifications_body'] ==
                                                  titleVerifyMessage
                                              ? "${107}".tr
                                              : "${controller.data[index]['notifications_body']}"),
                          trailing: Text(
                            translateDatabase(
                                formattedDate,
                                Jiffy.parse(controller.data[index]
                                        ['notifications_datetime'])
                                    .fromNow()),
                            /*  Jiffy(
                                        controller.data[index]
                                            ['notifications_datetime'],
                                        "yyyy-MM-dd")
                                    .fromNow(), */
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15.0,
                                    color: AppColor.secondColor),
                          ),
                        ),
                      )
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
