import 'package:depi_7_25/auth/models/login_model.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "onboardingBox";
  static const loginData = "loginData";

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
}
