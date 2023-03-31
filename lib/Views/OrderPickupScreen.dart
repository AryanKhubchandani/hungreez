import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hungreez/Controller/CartController.dart';
import 'package:hungreez/Controller/PickupController.dart';
import 'package:hungreez/Controller/PollingController.dart';
import 'package:hungreez/Views/HomeScreen.dart';
import 'package:hungreez/Widgets/CartItem.dart';
import 'package:hungreez/constants.dart';

class OrderPickupScreen extends StatelessWidget {
  CartController cartController = Get.find();
  PickupController pickupController = Get.find();
  PollingController pollingController = Get.put(PollingController());
  OrderPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Your Order Status:", textAlign: TextAlign.center)),
          const SizedBox(height: 8),
          Obx(()=> Text(pickupController.status.value.toString(), style: const TextStyle(color: clr1, fontSize: 20, letterSpacing: 1))),
          const SizedBox(height: 24),
          ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: cartController.cart.length,
              shrinkWrap: true,
              itemBuilder: (context, int idx) {
                return CartItem().buildItem(
                    cartController.cart[idx].name,
                    cartController.cart[idx].price,
                    cartController.cart[idx].time,
                    idx, false);
              }),
          const SizedBox(height: 24),
          Obx(() => (pickupController.status.value == OrderStatus.READY_FOR_PICKUP) ? GestureDetector(
            child: Container(
              height: 70,
              width: 150,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: clr1,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: const Text(
                "Collect your Order",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            onTap: (){
              deleteOrder(FirebaseAuth.instance.currentUser!.uid);
              cartController.reset();
              pickupController.status.value = OrderStatus.AWAIT_CONFIRM;
              Get.offAll(()=>HomeScreen());
            },
          ) : SizedBox() )
        ],
      ),
    );
  }

  Future<void> deleteOrder(String uid) async {
    var response = await http.delete(Uri.parse("$baseurl/api/order/$uid"));
  }
}

