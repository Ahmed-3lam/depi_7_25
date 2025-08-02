import 'package:depi_7_25/const.dart';
import 'package:depi_7_25/models/chat_model.dart';
import 'package:depi_7_25/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> myChats = [];
    for (var item in jsonList) {
      myChats.add(ChatModel.fromJson(item));
    }
    // List<ChatModel> myChats = jsonList
    //     .map((e) => ChatModel.fromJson(e))
    //     .toList();

    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customChat(icon: Icons.lock, text: "Locked Chats"),
            customChat(icon: Icons.archive, text: "Archived Chats", count: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: myChats.length,
              itemBuilder: (context, index) => _myChat(
                imagePath: myChats[index].imagePath!,
                name: myChats[index].name!,
                message: myChats[index].msg!,
                time: myChats[index].createdAt!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myChat({
    required String imagePath,
    required String name,
    required String message,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green.withOpacity(.4),
            backgroundImage: NetworkImage(imagePath),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(message, style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          Spacer(),
          Text(time, style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  Widget customChat({
    required IconData icon,
    required String text,
    int? count,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          if (count != null)
            Text(count.toString(), style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
