import 'package:depi_7_25/whatsapp/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessangerScreen extends StatefulWidget {
  const MessangerScreen({super.key});

  @override
  State<MessangerScreen> createState() => _MessangerScreenState();
}

class _MessangerScreenState extends State<MessangerScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Chats", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Icon(Icons.camera_alt),
          SizedBox(width: 30),
          Icon(Icons.edit),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          _searchContainer(),
          SizedBox(height: 10),
          Container(
            height: 100,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) => _statusWidget(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navItem(icon: CupertinoIcons.chat_bubble, title: "Chats"),
            _navItem(icon: CupertinoIcons.person_2_fill, title: "Persons"),
            _navItem(icon: CupertinoIcons.videocam_fill, title: "Video"),
            _navItem(icon: CupertinoIcons.settings, title: "Settings"),
          ],
        ),
      ),
    );
  }

  Widget _navItem({required IconData icon, required String title}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 30), Text("Chats")],
    );
  }

  Widget _statusWidget() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.blue),
            CircleAvatar(radius: 37, backgroundColor: Colors.white),
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(avatar1)),
            Positioned(
              bottom: 10,
              right: 12,
              child: CircleAvatar(radius: 8, backgroundColor: Colors.green),
            ),
          ],
        ),
        Text("Mohamed"),
      ],
    );
  }

  Container _searchContainer() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Text("Search", style: TextStyle(fontSize: 20, color: Colors.grey)),
        ],
      ),
    );
  }
}
