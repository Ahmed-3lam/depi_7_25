import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "onboardingBox";

  static void fillOnboardingBox() {
    Hive.box(onboardingBox).put(onboardingBox, true);
  }

  static bool isOnboardingBoxEmpty() {
    return Hive.box(HiveHelper.onboardingBox).isEmpty;
  }
}
