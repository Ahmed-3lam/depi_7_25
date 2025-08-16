import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 61, right: 24, left: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(imagePath + "logo_1.svg"),
                  SizedBox(height: 30),
                  Text(
                    "Welcome to our  ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF16162E),
                    ),
                  ),
                  Text(
                    "E-Grocery",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF40AA54),
                    ),
                  ),
                  SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Color(0xFF8B8B97),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(border: InputBorder.none),
                          validator: (value) {
                            if (value!.length != 11) {
                              return "Phone Number Should be 11 digits";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0xFF8B8B97),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextFormField(
                          obscureText: obscureText,
                          obscuringCharacter: "*",
                          validator: (value) {
                            if (value!.length < 6) {
                              return "Password should be more than 6 letters";
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                obscureText = !obscureText;
                                setState(() {});
                              },
                              child: Icon(
                                obscureText
                                    ? CupertinoIcons.eye_slash
                                    : CupertinoIcons.eye,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Forget Password?")],
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      _key.currentState!.validate();
                      setState(() {});
                    },
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF40AA54),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
