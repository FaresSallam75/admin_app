/* 
import 'package:delivery_app/controller/homepage/homepage_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/data/model/itemsmodel.dart';
import 'package:delivery_app/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListItemsHomePage extends GetView<HomePageControllerImp> {
  const ListItemsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Items(
          itemsModel: controller.items[index],
        ),
      ),
    );
  }
}

class Items extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 200,
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.network(
              "${AppLink.imageItems}/${itemsModel.itemsImage}",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 2,
            left: 30,
            child: Center(
              child: Text(
                "${itemsModel.itemsName}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
 */