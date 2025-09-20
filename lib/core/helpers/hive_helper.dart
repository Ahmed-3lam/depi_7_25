import 'package:depi_7_25/features/auth/models/login_model.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "onboardingBox";
  static const loginData = "loginData";
  static const tokenBox = "token";

  static void fillOnboardingBox() {
    Hive.box(onboardingBox).put(onboardingBox, true);
  }

  static bool isOnboardingBoxEmpty() {
    return Hive.box(HiveHelper.onboardingBox).isEmpty;
  }

  static Future setLoginData(LoginModel loginModel) async {
    await Hive.box(loginData).put(loginData, loginModel);
  }

  static getLoginData() {
    if (Hive.box(loginData).isNotEmpty) {
      LoginModel result = Hive.box(loginData).get(loginData);
      print("=============" + result.toJson());
    }
  }

  static setToken(String token) async {
    await Hive.box(tokenBox).put(tokenBox, token);
  }

  static String? getToken() {
    return Hive.box(tokenBox).get(tokenBox);
  }

  static void clearToken() {
    Hive.box(tokenBox).clear();
  }
}
