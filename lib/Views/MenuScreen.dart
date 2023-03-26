import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hungreez/Controller/CafeController.dart';
import 'package:hungreez/Models/MenuModel.dart';
import 'package:hungreez/Views/CartScreen.dart';
import 'package:hungreez/Widgets/MenuItem.dart';
import 'package:hungreez/constants.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  CafeController cafeController = Get.find();
  List<Menu> menu = [];

  @override
  void initState() {
    getMenuItems();
    cafeController.dispose();
    super.initState();
  }

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
      body: menu.length != 0
          ? ListView.builder(
              itemCount: menu.length,
              shrinkWrap: true,
              itemBuilder: (context, idx) {
                return MenuItem().buildItem(menu[idx].name, menu[idx].price);
              })
          : const Center(child: CircularProgressIndicator(color: clr1)),
    );
  }

  Future getMenuItems() async {
    var response =
        await http.get(Uri.parse("$baseurl/api/items/${cafeController.id}"));
    if (response.statusCode == 200) {
      print("Request success");
      setState(() {
        menu = menuFromJson(response.body);
      });
    }
  }
}
