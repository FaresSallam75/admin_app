import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/items/items_data.dart';
import 'package:admin_app/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ViewItemsController extends GetxController {
 ItemsData itemsData = ItemsData(Get.find());
  List<ItemsModel> data = [];
   StatusRequest statusRequest = StatusRequest.none;

     // List of items in our dropdown menu


  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.viewData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String id, String imageName) {
    Map dataMap = {"id": id, "file": imageName};
    itemsData.deleteData(dataMap);
    // ignore: unrelated_type_equality_checks
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  back() {
    Get.offAllNamed(AppRotes.homePage);
    return Future.value(false);
  }

   goToPageEdit(ItemsModel itemsModel) {
    Get.toNamed(AppRotes.editItems, arguments: {
      "itemsModel" : itemsModel
    });
  } 

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
