import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Controller/PickupController.dart';

class OrderPickupScreen extends StatelessWidget {
  PickupController pickupController = Get.put(PickupController(status: OrderStatus.ORDERING.obs));

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

