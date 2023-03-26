import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Controller/CafeController.dart';
import 'package:hungreez/Views/MenuScreen.dart';
import 'package:hungreez/constants.dart';

class CafeTile {
  Widget buildTile(String name, String id) {
    CafeController cafeController = Get.find();
    return GestureDetector(
      child: GridTile(
          child: Container(
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: clr1, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(name),
      )),
      onTap: () {
        cafeController.id.value = id;
        Get.to(() => MenuScreen());
      },
    );
  }
}
