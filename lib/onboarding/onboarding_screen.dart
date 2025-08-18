import 'package:flutter/material.dart';

import '../const.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 140, left: 30, right: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(imagePath + "onboarding_1.png"),
            ),
            SizedBox(height: 80),
            Text(
              "Browse all the category",
              style: TextStyle(
                fontFamily: "Griloy",
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "In aliquip aute exercitation ut et nisi ut mollit. Deserunt dolor elit pariatur aute .",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Griloy",
                fontSize: 16,
                color: Color(0xFF16162E),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: () {},
              child: Image.asset(
                imagePath + "next_1.png",
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
