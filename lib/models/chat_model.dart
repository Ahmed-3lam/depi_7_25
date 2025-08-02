class ChatModel {
  String? name;

  String? msg;

  String? imagePath;

  String? createdAt;

  ChatModel(this.name, this.msg, this.imagePath, this.createdAt);

  ChatModel.fromJson(Map json) {
    name = json["name"];
    msg = json["msg"];
    imagePath = json["image_path"];
    createdAt = json["created_at"];
  }
}
