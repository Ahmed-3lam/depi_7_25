class ProfileModel {
  int? statusCode;
  ProfileData? data;
  String? message;

  ProfileModel({this.statusCode, this.data, this.message});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

 
}

class ProfileData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? role;
  String? createdAt;

  ProfileData(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.role,
      this.createdAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    role = json['role'];
    createdAt = json['createdAt'];
  }


}
