import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungreez/Services/SendSMS.dart';
import 'package:hungreez/constants.dart';

class RegisterFormScreen extends StatefulWidget {
  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  String _email = "";
  String _password = "";
  String _phoneNumber = "";
  int _otp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Column(
                    children: <Widget>[
                      /// email
                      TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your email',
                            hintText: 'ex: test@gmail.com',
                          ),
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) {}),
                      const SizedBox(height: 10),

                      /// password
                      TextFormField(
                        controller: passController,
                        decoration: const InputDecoration(
                          labelText: 'Enter your password',
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          _password = value;
                        },
                        validator: (value) {},
                      ),
                      const SizedBox(height: 10),

                      /// phone number
                      TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your phone number',
                            hintText: 'ex: 93xxxxxxx2',
                          ),
                          onChanged: (value) {
                            _phoneNumber = value;
                          },
                          validator: (value) {}),
                      SizedBox(height: 36),

                      /// login/register button

                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: clr1,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25))),
                              child: Center(
                                  child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                            onTap: () {
                              sendOTP(phoneController.text);
                              Get.defaultDialog(
                                barrierDismissible: false,
                                title: "Verify Phone Number",
                                titleStyle: TextStyle(color: clr1),
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Enter the OTP received on the provided mobile number",
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      TextFormField(
                                        controller: otpController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: 'Enter OTP',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.black54),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        if (otpController.text ==
                                            _otp.toString()) {
                                          SignUp(_email, _password);
                                          Get.back();
                                          Get.back();
                                        }
                                      },
                                      child: Text("Submit",
                                          style: TextStyle(color: clr1))),
                                ],
                              );
                            },
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

  Future SignUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future sendOTP(String phoneNumber) async {
    var rnd = Random();
    var next = rnd.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    _otp = next.toInt();
    TwilioSMS().sendSMS("OTP: ${_otp.toString()}", phoneNumber);
  }
}
