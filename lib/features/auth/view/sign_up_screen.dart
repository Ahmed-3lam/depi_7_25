import 'package:depi_7_25/core/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.only(top: height * .1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              SizedBox(height: height * .04),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      label: "Name",
                      isBorderContainer: true,
                    ),
                    SizedBox(height: height * .02),
                    CustomTextField(
                      controller: _emailController,
                      label: "Email",
                      isBorderContainer: true,
                    ),
                    SizedBox(height: height * .02),
                    CustomTextField(
                      controller: _passwordController,
                      label: "Password",
                      isPassword: true,
                      isBorderContainer: true,
                    ),
                    SizedBox(height: height * .06),
                    Row(
                      children: [
                        Text("Sign Up", style: TextStyle(fontSize: 24)),
                        Spacer(),
                        Container(
                          height: height * .06,
                          width: height * .08,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Alreday Have Account?   "),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Welcome to our",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          ),
          Text(
            "grocery shop",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
