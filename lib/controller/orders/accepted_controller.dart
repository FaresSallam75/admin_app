import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/orders/accepted_orders.dart';
import 'package:admin_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class AcceptedOrdersController extends GetxController {
  AcceptedOrdersData acceptedOrdersData = AcceptedOrdersData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    defineLanguage();
    getOrdersAccepted();
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

  getOrdersAccepted() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await acceptedOrdersData.acceptedOrders();
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

  donePrepare(String ordersId, String usersId, String orderType) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await acceptedOrdersData.prepareOrders(ordersId, usersId, orderType);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrderPage();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageOrderDetails(OrdersModel ordersModel) {
    Get.toNamed(AppRotes.ordersDetails,
        arguments: {"ordersmodel": ordersModel});
  }

  refreshOrderPage() {
    getOrdersAccepted();
    update();
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
