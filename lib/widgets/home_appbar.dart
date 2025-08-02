import 'package:flutter/material.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.green,
    title: Text(
      "WhatsApp",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    actions: [
      Icon(Icons.camera_alt_outlined, color: Colors.white),
      SizedBox(width: 10),
      Icon(Icons.search, color: Colors.white),
      SizedBox(width: 10),
      Icon(Icons.more_vert, color: Colors.white),
    ],
  );
}
