import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Models/Cart.dart';
import 'package:hungreez/constants.dart';

class MenuItem {
  Widget buildItem(String name, int price) {
    CartController cartController = Get.find();
    Order _order = Order(name: name, price: price, quantity: 1.obs, time: 10.0);
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              //TODO: Network image for dishes
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        title: Text(name),
        subtitle: Text(price.toString()),
        trailing: IconButton(
            icon: Icon(Icons.add_circle_rounded, color: clr1),
            onPressed: () {
              cartController.cart.add(_order);
              cartController.total += price;
            }),
      ),
    );
  }
}
