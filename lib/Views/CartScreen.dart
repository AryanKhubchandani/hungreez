import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Models/Cart.dart';
import 'package:hungreez/Widgets/CartItem.dart';
import 'package:hungreez/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartController controller;

  @override
  void initState() {
    controller = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// custom top bar with total amount;
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 42, 12, 16),
            decoration: BoxDecoration(
                color: clr1,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(20))),
            child: Row(
              children: [
                const Text("Your order",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
                const Expanded(child: SizedBox(width: 1)),
                Obx(() => Text("total: ${controller.total}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)))
              ],
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: controller.cart.length,
                shrinkWrap: true,
                itemBuilder: (context, int idx) {
                  return CartItem().buildItem(
                      controller.cart[idx].name,
                      controller.cart[idx].price,
                      controller.cart[idx].time,
                      idx);
                }),
          )
        ],
      ),
    );
  }
}
