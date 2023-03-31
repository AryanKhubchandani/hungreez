import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:hungreez/Controller/CafeController.dart';
import 'package:hungreez/Controller/CartController.dart';
import 'package:hungreez/Models/Order.dart';

enum OrderStatus {AWAIT_CONFIRM, MAKING, READY_FOR_PICKUP}

class PickupController extends GetxController {
  Rx<OrderStatus> status = OrderStatus.AWAIT_CONFIRM.obs;
  CafeController cafeController = Get.find();


  void advanceStatus(Rx<OrderStatus> status) {
    if (status.value == OrderStatus.AWAIT_CONFIRM) {
      status.value = OrderStatus.MAKING;
    } else if (status.value == OrderStatus.MAKING) {
      status.value = OrderStatus.READY_FOR_PICKUP;
    }
  }

  Future<void> sendOrderDetails(CartController controller) async {
    Map<String, int> orders = {};
    for (Order order in controller.cart) {
      orders[order.name] = order.quantity.value;
    }

    var res = {
      "userId" : FirebaseAuth.instance.currentUser!.uid,
      "cafeId" : cafeController.id.value,
      "orderItems" : orders,
      "total" : controller.total.value.toString()
    };

    var response = await http.post(Uri.parse("https://food-preordering-app-backend.vercel.app/api/order"), body: jsonEncode(res), headers: {'Content-Type': 'application/json'}).then((value) {
      if (value.statusCode == 200) {
        advanceStatus(status);
        // polling();
      }
    });
  }
}