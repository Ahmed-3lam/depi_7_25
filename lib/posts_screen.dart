import 'dart:developer';

import 'package:depi_7_25/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  var response;
  List<PostModel> postList = [];
  bool isLoading = false;

  void fetchPosts() async {
    isLoading = true;
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
    response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    List apiList = response.data;

    for (var item in apiList) {
      PostModel post = PostModel.fromJson(item);
      postList.add(post);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: postList.length,
              separatorBuilder: (c, i) => Divider(),
              itemBuilder: (context, index) => ListTile(
                title: Text(postList[index].title ?? ""),
                subtitle: Text(postList[index].body ?? ""),
                trailing: Icon(Icons.access_time),
              ),
            ),
    );
  }
}
