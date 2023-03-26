import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Controller/CafeController.dart';
import 'package:hungreez/Models/Cart.dart';
import 'package:hungreez/Widgets/CafeTile.dart';

class CafeScreen extends StatelessWidget {
  CartController cartController = Get.find();
  CafeController cafeController = Get.put(CafeController(id: "".obs, name: ""));

  CafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        children: [
          CafeTile().buildTile("Food Court", "0xff1"),
          CafeTile().buildTile("Darling Cafe", "0xff2"),
          CafeTile().buildTile("Arasan", "0xff3"),
          CafeTile().buildTile("GDN Canteen", "0xff4"),
          CafeTile().buildTile("KC Foods", "0xff5"),
          CafeTile().buildTile("PRP Canteen", "0xff6"),
        ],
      ),
    );
  }
}
