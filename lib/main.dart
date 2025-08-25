import 'package:depi_7_25/auth/models/login_model.dart';
import 'package:depi_7_25/helpers/hive_helper.dart';
import 'package:depi_7_25/splash/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LoginModelAdapter());
  await Hive.openBox(HiveHelper.onboardingBox);
  await Hive.openBox(HiveHelper.loginData);

  //
  // // box.put("name", "Ahmed");
  //
  // String name = box.get("name");

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(fontFamily: "Gilroy"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

/// MVC
/// MVVM: View Model - View - Model
///
