import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Views/CartScreen.dart';
import 'package:hungreez/Views/ChatbotScreen.dart';
import 'package:hungreez/Views/CafeScreen.dart';
import 'package:hungreez/Views/ProfileScreen.dart';
import 'package:hungreez/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> bodyPages = [
    const ProfileScreen(),
    CafeScreen(),
    const ChatbotScreen()
  ];

  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: const Icon(Icons.menu_outlined, color: clr1),
            onTap: () {
              ///TODO: Drawer open
            },
          ),
          title: Row(
            children: [
              const Expanded(child: SizedBox(width: 1)),
              GestureDetector(
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: clr1,
                  size: 22,
                ),
                onTap: () {
                  Get.to(() => const CartScreen());
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: pageIndex,
          selectedItemColor: clr1,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded), label: "My Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined), label: "Cafe"),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer), label: "Ask us"),
          ],
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
        ),
        body: Stack(
          children: [
            IndexedStack(
              index: pageIndex,
              children: bodyPages,
            ),
          ],
        ));
  }
}
