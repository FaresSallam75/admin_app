import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/delivery/delivery_data.dart';
import 'package:admin_app/data/model/deliverymodel.dart';
import 'package:get/get.dart';

class ViewDeliveryController extends GetxController {
  DeliveryData deliveryData = DeliveryData(Get.find());
  List<DeliveryModel> deliveryModel = [];
  StatusRequest? statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    viewDeliveryData();
  }

  viewDeliveryData() async {
    deliveryModel.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response =
        // ignore: unnecessary_string_interpolations
        await deliveryData.deliveryData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        //deliveryModel.clear();
        deliveryModel
            .addAll(responseData.map((e) => DeliveryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  approveDeliveryData(String deliveryId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deliveryData.approveDeliveryData(deliveryId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        /* List responseData = response['data'];
        deliveryModel.addAll(responseData.map((e) {
          return DeliveryModel.fromJson(e);
        })); */
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
