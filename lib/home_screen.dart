import 'package:depi_7_25/const.dart';
import 'package:depi_7_25/models/chat_model.dart';
import 'package:depi_7_25/widgets/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> myChats = [];
    for (var item in jsonList) {
      myChats.add(ChatModel.fromJson(item));
    }
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
              itemBuilder: (context, index) => _myChat(model: myChats[index]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _myChat({required ChatModel model}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green.withOpacity(.4),
              backgroundImage: NetworkImage(model.imagePath!),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              _msgTypeWidget(model),
            ],
          ),
          Spacer(),
          Text(
            model.createdAt!,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _msgTypeWidget(ChatModel model) {
    if (model.msgType == MessageType.MSG) {
      return Text(
        model.msg!,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      );
    } else if (model.msgType == MessageType.VIDEO) {
      return Row(
        children: [Icon(Icons.video_call), SizedBox(width: 5), Text("Video")],
      );
    } else {
      return Row(children: [Icon(Icons.gif), SizedBox(width: 5), Text("GIF")]);
    }
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
