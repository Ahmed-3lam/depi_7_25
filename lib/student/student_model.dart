class StudentModel {
  int? id;
  String? name;
  int? age;
  StudentModel({this.id, this.name, this.age});

  StudentModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    age = json["age"];
  }
}
