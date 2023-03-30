import 'dart:async';

import 'package:get/get.dart';
import 'package:hungreez/Controller/CartController.dart';

enum OrderStatus {AWAIT_CONFIRM, MAKING, READY_FOR_PICKUP}

class PickupController extends GetxController {
  Rx<OrderStatus> status = OrderStatus.AWAIT_CONFIRM.obs;
  Timer? _timer;

  void advanceStatus(Rx<OrderStatus> status) {
    if (status.value == OrderStatus.AWAIT_CONFIRM) {
      status.value = OrderStatus.MAKING;
    } else if (status.value == OrderStatus.MAKING) {
      status.value = OrderStatus.READY_FOR_PICKUP;
    }
  }

  Future<void> sendOrderDetails(CartController controller) async {
    //TODO: make http post request to backend, and then...
    advanceStatus(status);
  }

  //TODO: make a polling function for backend to check for order updates
  void polling () {

  }
}