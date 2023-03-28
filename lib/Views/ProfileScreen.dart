import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hungreez/Controller/CartController.dart';
import 'package:hungreez/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.logout_rounded, color: clr1),
        onPressed: () {
          controller.cart.value = [];
          FirebaseAuth.instance.signOut();
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          GestureDetector(
            child: CircleAvatar(
              minRadius: 80,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.account_circle,
                size: 36,
                color: Colors.white,
              ),
            ),
            onTap: () {
              //TODO: uplaod/change and display profile image
            },
          ),
          SizedBox()
        ],
      ),
    );
  }
}
