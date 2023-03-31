import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hungreez/Controller/PickupController.dart';

class PollingController extends GetxController {
  String timeLeft = "";
  PickupController pickupController = Get.find();

  @override
  void onInit() {
    polling();
    super.onInit();
  }

  void polling() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 20)).then((value) async {
        print("new polling itr");
        var response = await http.put(Uri.parse("https://food-preordering-app-backend.vercel.app/api/order/${FirebaseAuth.instance.currentUser!.uid}"));
        if (response.statusCode == 200) {
          pickupController.advanceStatus(pickupController.status);
        }
      });
      break;
    }
  }
}