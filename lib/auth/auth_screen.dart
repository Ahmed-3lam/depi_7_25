import 'dart:async';

import 'package:depi_7_25/const.dart';
import 'package:depi_7_25/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String image = "background_2.png";

  Timer? timer;
  int count = 0;

  @override
  initState() {
    timer = Timer.periodic(const Duration(milliseconds: 500), ((timer) {
      count++;
      if (image == "background_1.png") {
        image = "background_2.png";
      } else {
        image = "background_1.png";
      }

      setState(() {});
      // if (count == 5) {
      //   Get.to(AuthScreen());
      // }
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(imagePath + image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 130.0,
              left: 30,
              right: 30,
              bottom: 46,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to our  ",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                ),
                Text(
                  "E-Grocery",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.green,
                  ),
                ),
                Spacer(),
                CustomButton(title: "Continue with Email or Phone"),
                SizedBox(height: 20),
                CustomButton(
                  title: "Create an account",
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
