import 'package:depi_7_25/core/firebase/firestore_service.dart';
import 'package:depi_7_25/features/auth/models/login_model.dart';
import 'package:depi_7_25/core/network/dio_helper.dart';
import 'package:depi_7_25/core/helpers/hive_helper.dart';
import 'package:depi_7_25/features/auth/view/login_screen.dart';
import 'package:depi_7_25/features/splash/splash_screen.dart';

import 'package:depi_7_25/firebase_options.dart';
import 'package:depi_7_25/l10n/app_localizations.dart';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  FirebaseMessaging.instance
      .requestPermission(alert: true, badge: true, sound: true);
  FirebaseMessaging.instance.getToken().then((token) {
    assert(token != null);
    print(token.toString());
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final RemoteNotification? notification = message.notification;
    final AndroidNotification? android = message.notification?.android;

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
              // other properties...
            ),
          ));
    }
  });
  
  
  // final google = await GoogleSignIn.instance.initialize(
  //   clientId: googleClientId,
  // );
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      useInheritedMediaQuery: true,
      locale: Locale("ar"),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(fontFamily: "Gilroy"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
