import 'package:depi_7_25/core/firebase/firestore_service.dart';
import 'package:depi_7_25/core/secrets.dart';
import 'package:depi_7_25/features/auth/models/login_model.dart';
import 'package:depi_7_25/core/network/dio_helper.dart';
import 'package:depi_7_25/core/helpers/hive_helper.dart';
import 'package:depi_7_25/features/auth/view/login_screen.dart';
import 'package:depi_7_25/features/splash/splash_screen.dart';

import 'package:depi_7_25/firebase_options.dart';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final google = await GoogleSignIn.instance.initialize(
    clientId: googleClientId,
  );


  
  await Hive.initFlutter();
  Hive.registerAdapter(LoginModelAdapter());
  await Hive.openBox(HiveHelper.onboardingBox);
  await Hive.openBox(HiveHelper.loginData);
  await Hive.openBox(HiveHelper.tokenBox);
  DioHelper.initialized();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  await FirestoreService.getBanners();
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
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
