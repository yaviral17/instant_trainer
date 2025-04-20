import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instant_trainer/Utils/storage/local_storage.dart';
import 'package:instant_trainer/Utils/theme/theme.dart';
import 'package:instant_trainer/controllers/init_controllers.dart';
import 'package:instant_trainer/screens/dietplan/dietplan.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instant_trainer/screens/home/home_screen.dart';
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
  PSize.screenHeight = 812;
  PSize.screenWidth = 375;
  await GetStorage.init();
  log(
    'GetStorage initialized  diet plan ${LocalStorage().getData('dietPlan')}',
  );
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
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/dietplan', page: () => const DietplanScreen()),
        GetPage(name: '/landing', page: () => const LandingAuthScreen()),
      ],
    );
  }
}
