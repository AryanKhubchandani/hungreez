import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Models/Cafe.dart';
import 'package:hungreez/Models/Cart.dart';
import 'package:hungreez/Views/MenuScreen.dart';
import 'package:hungreez/constants.dart';

class CafeScreen extends StatelessWidget {
  CartController cartController = Get.find();
  CafeController cafeController = Get.put(CafeController(id: "".obs, name: ""));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        children: [
          GestureDetector(
            child: GridTile(
                child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: clr1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text("Food Court"),
            )),
            onTap: () {
              cafeController.id.value = "0xff1";
              Get.to(() => MenuScreen());
            },
          ),
          GestureDetector(
            child: GridTile(
                child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: clr1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text("Darling Cafe"),
            )),
            onTap: () {
              cafeController.id.value = "0xff2";
              Get.to(() => MenuScreen());
            },
          ),
          GestureDetector(
            child: GridTile(
                child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: clr1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text("Arasan"),
            )),
            onTap: () {
              cafeController.id.value = "0xff3";
              Get.to(() => MenuScreen());
            },
          ),
          GestureDetector(
            child: GridTile(
                child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: clr1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text("GDN Canteen"),
            )),
            onTap: () {
              cafeController.id.value = "0xff4";
              Get.to(() => MenuScreen());
            },
          ),
          GestureDetector(
            child: GridTile(
                child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: clr1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text("KC Foods"),
            )),
            onTap: () {
              cafeController.id.value = "0xff5";
              Get.to(() => MenuScreen());
            },
          ),
          GestureDetector(
            child: GridTile(
                child: Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: clr1,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text("PRP Canteen"),
            )),
            onTap: () {
              cafeController.id.value = "0xff6";
              Get.to(() => MenuScreen());
            },
          ),
        ],
      ),
    );
  }
}
