import 'package:hive/hive.dart';

part 'login_model.g.dart';

@HiveType(typeId: 0)
class LoginModel extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;

  @HiveField(2)
  final String? token;

  LoginModel({required this.email , required this.password , this.token});

  String toJson() {
    return """
    { email: $email ,
    password: $password, token $token}
       
    """;
  }
}

// flutter pub run build_runner build
