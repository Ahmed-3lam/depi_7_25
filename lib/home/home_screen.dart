import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Padding(
          padding: EdgeInsetsDirectional.only(start: width / 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.pin_drop),
              SizedBox(width: width * .01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.green,
                        size: 30,
                      ),
                    ],
                  ),
                  Text(
                    "Shebin Elkom",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * .03,
            left: width * .04,
            right: width * .04,
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ), // Adjust the radius as needed
                ),
                child: Image.network(
                  "https://cdn.britannica.com/17/196817-159-9E487F15/vegetables.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
