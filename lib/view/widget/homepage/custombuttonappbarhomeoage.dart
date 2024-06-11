
import 'package:admin_app/controller/orders/order_screen_controller.dart';
import 'package:admin_app/view/widget/homepage/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHomePage extends StatelessWidget {
  const CustomButtonAppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreeenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length,
              (index) {
                
                return Expanded(
                  child: CustomButtonAppBar(
                    textButton: controller.buttonAppBar[index]['title'],
                    iconData: controller.buttonAppBar[index]['icon'],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    activeColor: controller.currentPage == index ? true : false,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
