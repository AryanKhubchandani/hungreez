import 'package:flutter/material.dart';
import 'package:hungreez/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.menu_outlined, color: clr1),
          onTap: () {
            ///TODO: Drawer open
          },
        ),
        title: Row(
          children: [
            Expanded(child: SizedBox(width: 1)),
            GestureDetector(
              child: Icon(
                Icons.shopping_cart_outlined,
                color: clr1,
                size: 22,
              ),
              onTap: () {
                //TODO: go to cart page
              },
            )
          ],
        ),
      ),
    );
  }
}
