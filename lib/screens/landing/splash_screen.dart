import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/storage/local_storage.dart';
import 'package:instant_trainer/screens/dietplan/dietplan.dart';
import 'package:instant_trainer/screens/home/home_screen.dart';
import 'package:instant_trainer/screens/landing/landing_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initStates
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // log(LocalStorage().dataExists('dietPlan').toString(), name: "dietPlan");
      LocalStorage().dataExists('dietPlan')
          ? PNavigate.to(DietplanScreen())
          : PNavigate.to(LandingAuthScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        'assets/images/splash.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
