import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/screens/home/home_screen.dart';
import 'package:instant_trainer/screens/onboarding/onboarding_screen1.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LandingAuthScreen extends StatefulWidget {
  const LandingAuthScreen({super.key});

  @override
  State<LandingAuthScreen> createState() => _LandingAuthScreenState();
}

class _LandingAuthScreenState extends State<LandingAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/auth_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withAlpha(0), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/logo1.png',
                      width: PSize.arw(context, 90),
                    ),
                    const SizedBox(height: 20),
                    FittedBox(
                      child: Text(
                        'Welcome to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: PSize.arw(context, 64),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'trainer.ai',
                        style: TextStyle(
                          fontSize: PSize.arw(context, 64),
                          color: PColors.primary(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: PSize.rh(context, 20)),
                    FittedBox(
                      child: Text(
                        'Your Instant AI 🤖 Trainer ',
                        style: TextStyle(
                          fontSize: PSize.arw(context, 20),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Get started with your fitness journey',
                        style: TextStyle(
                          fontSize: PSize.arw(context, 20),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: PSize.rh(context, 20)),
                    ZoomTapAnimation(
                      onTap: () {
                        // Navigate to the next screen
                        // light haptic feedback
                        HapticFeedback.lightImpact();
                        PNavigate.to(const OnboardingScreen1());
                      },
                      child: Container(
                        width: PSize.arw(context, 207),
                        height: PSize.arh(context, 64),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: PColors.primary(context),
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: PSize.arw(context, 10)),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.white,
                              size: PSize.arw(context, 28),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: PSize.rh(context, 20)),

                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Already have an account?',
                    //       style: TextStyle(
                    //         fontSize: PSize.arw(context, 20),
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     ZoomTapAnimation(
                    //       onTap: () {
                    //         // Navigate to the login screen
                    //         // PNavigate.to(const HomeScreen());
                    //         // light haptic feedback
                    //         HapticFeedback.lightImpact();
                    //       },
                    //       child: Text(
                    //         'Login',
                    //         style: TextStyle(
                    //           fontSize: PSize.arw(context, 20),
                    //           color: PColors.primary(context),
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: PSize.rh(context, 20)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
