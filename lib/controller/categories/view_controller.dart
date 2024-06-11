import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/categories/categories_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ViewCategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());
  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.viewData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String id, String imageName) {
    Map dataMap = {"id": id, "file": imageName};
    categoriesData.deleteData(dataMap);
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  back() {
    Get.offAllNamed(AppRotes.homePage);
    return Future.value(false);
  }

  goToPageEdit(CategoriesModel categoriesModel) {
    Get.toNamed(AppRotes.editCategories,
        arguments: {"categoriesModel": categoriesModel});
  }

  defineLanguage() async {
    print("======================= start of service ");
    myServices.sharedPref.getString("lang") == "ar"
        ? await Jiffy.setLocale("ar")
        : await Jiffy.setLocale("en");
    update();
    print("======================= end of service ");
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    defineLanguage();
  }
}
