import 'dart:async';

import 'package:depi_7_25/auth/auth_screen.dart';
import 'package:depi_7_25/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String image = "logo_2.svg";
  Color backgroundColor = Colors.green;

  Timer? timer;
  int count = 0;

  @override
  initState() {
    timer = Timer.periodic(const Duration(milliseconds: 500), ((timer) {
      count++;
      if (backgroundColor == Colors.green) {
        image = "logo_3.svg";
        backgroundColor = Colors.white;
      } else {
        image = "logo_2.svg";
        backgroundColor = Colors.green;
      }

      setState(() {});
      if (count == 5) {
        timer.cancel();
        Get.to(AuthScreen());
      }
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(child: SvgPicture.asset(imagePath + image)),
    );
  }
}
