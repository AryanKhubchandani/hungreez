import 'package:get/get.dart';
import 'package:hungreez/Models/Order.dart';

class CartController extends GetxController {
  RxList cart = [].obs;
  RxInt total = 0.obs;
  RxBool isOrderLive = false.obs;

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

  void makeOrderLive() {
    isOrderLive.value = true;
  }

  void reset() {
    cart.clear();
    total.value = 0;
    isOrderLive.value = true;
  }
}


