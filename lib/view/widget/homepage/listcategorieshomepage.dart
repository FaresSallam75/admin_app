/* 
import 'package:delivery_app/controller/homepage/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHomePage extends GetView<HomePageControllerImp> {
  const ListCategoriesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageItems(
            controller.categories, i, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 179, 170),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 70,
            height: 70,
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.secondColor,
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(color: AppColor.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
 */