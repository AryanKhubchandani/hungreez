import 'package:flutter/material.dart';
import 'package:hungreez/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 42, 12, 16),
            decoration: BoxDecoration(
                color: clr1,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(20))),
            child: Row(
              children: [
                Text("Your order",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
                Expanded(child: SizedBox(width: 1)),
                Text("total: ")
              ],
            ),
          )
        ],
      ),
    );
  }
}
