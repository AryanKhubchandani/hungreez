import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:hungreez/constants.dart';

Widget chat(String message, int data) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment:
          data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        data == 0
            ? Container(
                height: 50,
                width: 50,
                child: const CircleAvatar(
                  backgroundColor: clr1,
                  child: Text("Rei", style: TextStyle(color: Colors.white)),
                ),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Bubble(
              borderWidth: data == 0 ? 1 : 0,
              borderColor: clr1,
              radius: const Radius.circular(15.0),
              color: data == 0 ? Colors.white : clr1,
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        child: Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Text(
                        message,
                        style: data == 0
                            ? const TextStyle(
                                color: clr1, fontWeight: FontWeight.bold)
                            : const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
              )),
        ),
        data == 1
            ? Container(
                child: const CircleAvatar(
                  minRadius: 25,
                  child: CircleAvatar(
                    minRadius: 24,
                    backgroundColor: Colors.white,
                    child: Text("You", style: TextStyle(color: clr1)),
                  ),
                  backgroundColor: clr1,
                ),
              )
            : const SizedBox(),
      ],
    ),
  );
}
