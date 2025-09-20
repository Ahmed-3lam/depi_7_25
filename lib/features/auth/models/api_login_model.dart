class ApiLoginModel {
  int? statusCode;
  LoginData? data;
  String? message;

  ApiLoginModel({this.statusCode, this.data, this.message});

  ApiLoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ?  LoginData.fromJson(json['data']) : null;
    message = json['message'];
  }

 
}

class LoginData {
  String? token;
  User? user;

  LoginData({this.token, this.user});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  User({this.id, this.name, this.email, this.phone, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  
}
