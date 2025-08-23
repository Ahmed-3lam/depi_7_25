import 'package:depi_7_25/auth/auth_screen.dart';
import 'package:depi_7_25/helpers/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 140, left: 30, right: 30),
        child: Column(
          children: [
            Container(
              height: 380,
              width: double.infinity,
              child: Image.asset(imagePath + "onboarding_$count.png"),
            ),
            SizedBox(height: 80),
            Text(
              titles[count - 1],
              style: TextStyle(
                fontFamily: "Griloy",
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              descriptions[count - 1],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Griloy",
                fontSize: 16,
                color: Color(0xFF16162E),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                if (count < 3) {
                  count++;
                  setState(() {});
                } else {
                  HiveHelper.fillOnboardingBox();
                  Get.offAll(AuthScreen());
                }
              },
              child: Image.asset(
                imagePath + "next_$count.png",
                height: 88,
                width: 88,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
