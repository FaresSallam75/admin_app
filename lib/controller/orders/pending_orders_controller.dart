import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/orders/pending_orders.dart';
import 'package:admin_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find());

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    defineLanguage();
    getOrdersData();
  }

  String printOrderType(String val) {
    if (val == "0") {
      return "85".tr;
    } else {
      return "86".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "82".tr;
    } else {
      return "83".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "145".tr;
    } else if (val == "1") {
      return "146".tr;
    } else if (val == "2") {
      return "147".tr;
    } else if (val == "3") {
      return "148".tr;
    } else {
      return "149".tr;
    }
  }

  getOrdersData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.pendingOrders();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  approveOrders(String ordersId, String usersId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.approveOrders(ordersId, usersId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrdersData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

/*   refreshOrderNotification(data) {
    print("pade id ============================");
    data['pageid'];
    print("pade name ============================");
    data['pagename'];

    print("current Rote  ${Get.currentRoute} ========================= ");
    if (Get.currentRoute == "/pendingorders" &&
        data['pagename'] == "refreshorder") {
      AcceptedOrdersController controller = Get.find();
      controller.refreshOrderPage();
    }
  } */

  refreshOrderPage() {
    getOrdersData();
    update();
  }

  goToPageOrderDetails(OrdersModel ordersModel) {
    Get.toNamed(AppRotes.ordersDetails,
        arguments: {"ordersmodel": ordersModel});
  }

  defineLanguage() async {
    print("======================= start of service ");
    myServices.sharedPref.getString("lang") == "ar"
        ? await Jiffy.setLocale("ar")
        : await Jiffy.setLocale("en");
    update();
    print("======================= end of service ");
  }
}
