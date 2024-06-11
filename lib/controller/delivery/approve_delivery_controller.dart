/* 
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/delivery/delivery_data.dart';
import 'package:admin_app/data/model/deliverymodel.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';

class ApproveDeliveryController extends GetxController {
  
  DeliveryData deliveryData = DeliveryData(Get.find());
  List<DeliveryModel> deliveryModel = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    super.onInit();
    approveDeliveryData();
  }

  approveDeliveryData() async {
    statusRequest = StatusRequest.loading;
    var response = await deliveryData.deliveryData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        deliveryModel.addAll(responseData.map((e) {
          return DeliveryModel.fromJson(e);
        }));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
 */