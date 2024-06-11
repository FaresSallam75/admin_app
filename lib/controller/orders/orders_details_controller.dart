import 'dart:async';

import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/orders/details_orders.dart';
import 'package:admin_app/data/model/cartmodel.dart';
import 'package:admin_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  late Completer<GoogleMapController> completerController;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];

  DetailsOrdersData detailsOrdersData = DetailsOrdersData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

  getCurrentLocation() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(ordersModel.addressLatt!),
          double.parse(ordersModel.addressLatt!),
        ),
        zoom: 12.4746,
      );
      markers.add(
        Marker(
          markerId: const MarkerId("1"),
          position: LatLng(
            double.parse(ordersModel.addressLatt!),
            double.parse(ordersModel.addressLatt!),
          ),
        ),
      );
    }
    update();
  }

  getOrdersDetailsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailsOrdersData.detailsOrders(ordersModel.ordersId!);
    print("ordersId ordersId ordersId ordersId ============== ${ordersModel.ordersId!} ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getCurrentLocation();
    getOrdersDetailsData();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
