import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Controller/CartController.dart';
import 'package:hungreez/constants.dart';

class CartItem {
  Widget buildItem(String name, int price, double time, int idx) {
    CartController controller = Get.find();
    RxInt quantity = controller.cart[idx].quantity;

    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(name),
        subtitle: Text(price.toString()),
        trailing: SizedBox(
          width: 80,
          child: Row(
            children: [
              Obx(
                () => GestureDetector(
                    onTap: quantity.value > 0
                        ? () {
                            quantity.value -= 1;
                            controller.total -= controller.cart[idx].price;
                            if (quantity.value == 0) {
                              controller.cart.removeAt(idx);
                            }
                          }
                        : () {},
                    child: Icon(Icons.remove_circle_rounded, color: clr1)),
              ),
              const SizedBox(width: 8),
              Obx(() => Text(quantity.toString())),
              const SizedBox(width: 8),
              GestureDetector(
                  child: Icon(Icons.add_circle_rounded, color: clr1),
                  onTap: () {
                    quantity.value += 1;
                    controller.total += controller.cart[idx].price;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
