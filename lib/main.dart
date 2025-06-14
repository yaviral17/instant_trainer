import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instant_trainer/Utils/storage/local_storage.dart';
import 'package:instant_trainer/Utils/theme/theme.dart';
import 'package:instant_trainer/controllers/init_controllers.dart';
import 'package:instant_trainer/firebase_options.dart';
import 'package:instant_trainer/screens/dietplan/dietplan.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instant_trainer/screens/dashboard/dashboard_screen.dart';
import 'package:instant_trainer/screens/landing/landing_auth.dart';
import 'package:instant_trainer/screens/landing/splash_screen.dart';

import 'Utils/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await LocalStorage().initialize();

  PSize.screenHeight = 812;
  PSize.screenWidth = 375;
  // log(
  //   'GetStorage initialized  diet plan ${LocalStorage().getData('dietPlan')}',
  // );
  initializeControllers();
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Instant Trainer',
      theme: PAppTheme.lightTheme,
      darkTheme: PAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // builder: (context, child) {
      //   return LocalStorage().dataExists('dietPlan')
      //       ? DietplanScreen()
      //       : LandingAuthScreen();
      // },
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(
          name: '/dietplan',
          page: () => const DietplanScreen(dietPlanData: {}),
        ),
        GetPage(name: '/landing', page: () => const LandingAuthScreen()),
      ],
    );
  }
}
