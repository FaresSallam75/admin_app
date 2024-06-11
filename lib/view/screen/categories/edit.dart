import 'package:admin_app/controller/categories/edit_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/function/validinput.dart';
import 'package:admin_app/core/shared/customtestformgeneral.dart';
import 'package:admin_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategories extends StatelessWidget {
  const EditCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoriesController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("174".tr),
      ),
      body: GetBuilder<EditCategoriesController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustoemTextFormGeneral(
                    labl: "170".tr,
                    hinText: "171".tr,
                    iconData: Icons.card_travel,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustoemTextFormGeneral(
                    labl: "${"170".tr} ${"172".tr}",
                    hinText: "${"171".tr} ${"172".tr}",
                    iconData: Icons.card_travel,
                    myController: controller.nameAr,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  MaterialButton(
                    height: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    onPressed: () {
                      controller.chooseImage();
                    },
                    child:  Text(
                      "173".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (controller.file != null)
                  /*   SvgPicture.file(

                      controller.file!,
                      height: 50,
                      width: 50,
                    ), */
                  CustomButtonAuth(
                    text: "35".tr,
                    onBressed: () {
                      controller.editData();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
