class ChatModel {
  String? name;

  String? msg;

  String? imagePath;

  String? createdAt;

  MessageType? msgType;

  ChatModel(this.name, this.msg, this.imagePath, this.createdAt);

  ChatModel.fromJson(Map json) {
    name = json["name"];
    msg = json["msg"];
    imagePath = json["image_path"];
    createdAt = json["created_at"];
    msgType = getMsgType(json["msg_type"]);
  }
}

enum MessageType { VIDEO, GIF, MSG }

MessageType getMsgType(String msgType) {
  switch (msgType) {
    case "msg":
      return MessageType.MSG;
    case "video":
      return MessageType.VIDEO;

    default:
      return MessageType.GIF;
  }
}
