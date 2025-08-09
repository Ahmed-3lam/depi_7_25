import 'package:flutter/material.dart';

enum SexType { MALE, FEMALE }

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height = 100;
  double weight = 0;
  double age = 0;
  SexType type = SexType.MALE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black.withOpacity(.8),
        padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            _header(),
            SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        type = SexType.MALE;
                        setState(() {});
                      },
                      child: Container(
                        decoration: _decoration(
                          color: type == SexType.MALE ? Colors.red : null,
                        ),
                        child: Center(
                          child: Text(
                            "Male",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        type = SexType.FEMALE;
                        setState(() {});
                      },
                      child: Container(
                        decoration: _decoration(
                          color: type == SexType.FEMALE ? Colors.red : null,
                        ),
                        child: Center(
                          child: Text(
                            "Female",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: _decoration(),
                child: Column(
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toInt().toString(),
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "CM",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.red,
                      min: 100,
                      max: 220,
                      value: height,
                      onChanged: (value) {
                        height = value;
                        setState(() {});
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 220,
                      padding: EdgeInsets.all(10),
                      decoration: _decoration(),
                      child: Column(
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            weight.toInt().toString(),
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  weight++;
                                  setState(() {});
                                },
                                shape: const CircleBorder(),
                                backgroundColor: Colors.black,
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                              Spacer(),
                              FloatingActionButton(
                                onPressed: () {
                                  if (weight > 0) weight--;
                                  setState(() {});
                                },
                                shape: const CircleBorder(),
                                backgroundColor: Colors.black,
                                child: Icon(Icons.remove, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 220,
                      padding: EdgeInsets.all(10),
                      decoration: _decoration(),
                      child: Column(
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            age.toInt().toString(),
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  age++;
                                  setState(() {});
                                },
                                shape: const CircleBorder(),
                                backgroundColor: Colors.black,
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                              Spacer(),
                              FloatingActionButton(
                                onPressed: () {
                                  if (age > 0) age--;
                                  setState(() {});
                                },
                                shape: const CircleBorder(),
                                backgroundColor: Colors.black,
                                child: Icon(Icons.remove, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                var bmi = weight / (height * height) * 10000;
                var result = "";
                switch (bmi) {
                  case < 18.5:
                    result = "Underweight";
                  case >= 18.5 && <= 24.9:
                    result = "Normal weight";
                  case >= 25 && <= 29.9:
                    result = "Overweight";

                  default:
                    result = "Obese";
                }

                showAlertDialog(context, title: result);
                print(bmi.toString());
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Calculate your bmi",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration({Color? color}) {
    return BoxDecoration(
      color: color ?? Colors.black.withOpacity(.4),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
        Spacer(),
        Icon(Icons.refresh, color: Colors.white),
      ],
    );
  }

  void showAlertDialog(BuildContext context, {required String title}) {
    AlertDialog alert = AlertDialog(title: Text(title));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

/// x , 2x , 2x   ... 300
/// x + 2x + 2x = 300
/// 5 x = 300
///  x = 60
/// * (4/7)
/// * (2/7)
/// * (1/7)
