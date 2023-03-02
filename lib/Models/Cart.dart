import 'package:get/get.dart';

class CartController extends GetxController {
  RxList cart = [].obs;
  RxInt total = 0.obs;

  void addItem(Order order) {
    cart.add(order);
    total.value += order.price;
  }

  void clearCart() {
    cart.clear();
    total.value = 0;
  }

  void removeItem(Order order) {
    cart.remove(order);
    total.value -= order.price;
  }
}

class Order {
  String name;
  int price;
  RxInt quantity;
  double time;

  Order(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.time});
}
