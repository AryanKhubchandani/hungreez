import 'package:get/get.dart';

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