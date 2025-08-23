import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bmi_cubit.dart';
import 'bmi_state.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Container(
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
                            context.read<BmiCubit>().updateSexType(SexType.MALE);
                          },
                          child: Container(
                            decoration: _decoration(
                              color: state.sexType == SexType.MALE ? Colors.red : null,
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
                            context.read<BmiCubit>().updateSexType(SexType.FEMALE);
                          },
                          child: Container(
                            decoration: _decoration(
                              color: state.sexType == SexType.FEMALE ? Colors.red : null,
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
                              state.height.toInt().toString(),
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
                          value: state.height,
                          onChanged: (value) {
                            context.read<BmiCubit>().updateHeight(value);
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
                                state.weight.toInt().toString(),
                                style: TextStyle(color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      context.read<BmiCubit>().incrementWeight();
                                    },
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                  Spacer(),
                                  FloatingActionButton(
                                    onPressed: () {
                                      context.read<BmiCubit>().decrementWeight();
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
                                state.age.toInt().toString(),
                                style: TextStyle(color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      context.read<BmiCubit>().incrementAge();
                                    },
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                  Spacer(),
                                  FloatingActionButton(
                                    onPressed: () {
                                      context.read<BmiCubit>().decrementAge();
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
                BlocListener<BmiCubit, BmiState>(
                  listener: (context, state) {
                    if (state.bmiResult != null) {
                      showAlertDialog(context, title: state.bmiResult!);
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context.read<BmiCubit>().calculateBmi();
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
                ),
              ],
            ),
          );
        },
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
