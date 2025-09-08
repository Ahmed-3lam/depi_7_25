class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.body, this.title});

  PostModel.fromJson(Map json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}



  //  {
  //       "userId": 1,
  //       "id": 1,
  //       "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  //       "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  //   },