import 'package:hive/hive.dart';

part 'login_model.g.dart';

@HiveType(typeId: 0)
class LoginModel extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;

  LoginModel(this.email, this.password);

  String toJson() {
    return """
    { email: $email ,
    password: $password,}
       
    """;
  }
}

// flutter pub run build_runner build
