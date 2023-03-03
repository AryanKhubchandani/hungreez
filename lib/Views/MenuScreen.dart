import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Models/Cart.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  CartController controller = Get.find();

  @override
  void initState() {
    controller.cart
        .add(Order(name: "spaghetti", price: 150, time: 20.0, quantity: 1.obs));
    controller.cart
        .add(Order(name: "spaghetti", price: 150, time: 20.0, quantity: 1.obs));
    controller.cart
        .add(Order(name: "spaghetti", price: 150, time: 20.0, quantity: 1.obs));
    controller.total.value = 450;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
