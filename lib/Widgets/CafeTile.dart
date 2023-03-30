import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Controller/CafeController.dart';
import 'package:hungreez/Controller/CartController.dart';
import 'package:hungreez/Views/MenuScreen.dart';
import 'package:hungreez/constants.dart';

class CafeTile {
  CafeController cafeController = Get.find();
  CartController cartController = Get.find();

  Widget buildTile(String name, String id) {
    return GestureDetector(
      child: GridTile(
          child: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: clr1, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(name),
      )),
      onTap: () {
        if (cartController.isOrderLive.value) {
          Get.snackbar("Hungreez", "Order already placed");
        } else {
          cafeController.id.value = id;
          Get.to(() => const MenuScreen());
        }
      },
    );
  }
}
