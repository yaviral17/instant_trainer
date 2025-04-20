import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/Utils/helpers/helper.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/models/fitness_goal_model.dart';
import 'package:instant_trainer/screens/onboarding/onboarding_screen4.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  final controller = Get.find<OnboardingController>();

  void onContinue() {
    if (controller.selectedFitnessGoat.value.title == null) {
      PHelper.showErrorMessageGet(
        title: "Please select a fitness goal",
        message: "Select a fitness goal to continue",
      );
    } else {
      // Navigate to the next screen
      PNavigate.materialFade(OnboardingScreen4());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(color: PColors.background(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZoomTapAnimation(
                    onTap: () => PNavigate.back(),
                    child: Container(
                      width: PSize.arw(context, 48),
                      height: PSize.arw(context, 48),
                      decoration: BoxDecoration(
                        color: PColors.primaryText(context),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: PColors.background(context),
                        size: PSize.arw(context, 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Assessment',
                    style: TextStyle(
                      fontSize: PSize.arw(context, 24),
                      color: PColors.primaryText(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    // height: PSize.arh(context, 32),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: PColors.primary(context).withAlpha(45),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text(
                        '3 of 6',
                        style: TextStyle(
                          fontSize: PSize.arw(context, 20),
                          color: PColors.primary(context),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: PSize.arh(context, 20)),
            Text(
              'Select your fitness goal',
              style: TextStyle(
                fontSize: PSize.arw(context, 18),
                color: PColors.primaryText(context),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: PSize.arh(context, 4)),
            Text(
              'This will help us to create a personalized plan for you',
              style: TextStyle(
                fontSize: PSize.arw(context, 14),
                color: PColors.primaryText(context).withAlpha(150),
                fontWeight: FontWeight.w400,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: FitnessGoalModel.fitnessGoals.length,
                shrinkWrap: false,
                padding: const EdgeInsets.only(top: 18),
                itemBuilder: (context, index) {
                  return Obx(
                    () => FitnessGoalCardWidget(
                      diet: FitnessGoalModel.fitnessGoals[index],
                      isSelected:
                          controller.selectedFitnessGoat.value ==
                                  FitnessGoalModel.fitnessGoals[index]
                              ? true
                              : false,
                      onTap: () {
                        controller.selectedFitnessGoat.value =
                            FitnessGoalModel.fitnessGoals[index];
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ZoomTapAnimation(
            onTap: () => onContinue(),
            child: Container(
              width: PSize.displayWidth(context),
              height: PSize.arh(context, 56),
              decoration: BoxDecoration(
                color: PColors.primaryText(context),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: PSize.arw(context, 20),
                      color: PColors.background(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: PSize.arw(context, 10)),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: PColors.background(context),
                    size: PSize.arw(context, 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FitnessGoalCardWidget extends StatelessWidget {
  const FitnessGoalCardWidget({
    super.key,
    required this.diet,
    this.isSelected = false,
    required this.onTap,
  });
  final bool isSelected;
  final void Function() onTap;
  final FitnessGoalModel diet;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? PColors.primary(context)
                  : PColors.primaryText(context).withAlpha(18),
          borderRadius: BorderRadius.circular(18),
          border:
              isSelected
                  ? Border.all(
                    color: PColors.background(context).withAlpha(150),
                    width: 4,
                  )
                  : Border.all(
                    color: PColors.background(context).withAlpha(0),
                    width: 4,
                  ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diet.title ?? "",
                    style: TextStyle(
                      fontSize: PSize.arw(context, 18),
                      color: PColors.primaryText(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: PSize.arh(context, 4)),
                  Text(
                    diet.description ?? "",
                    style: TextStyle(
                      fontSize: PSize.arw(context, 14),
                      color:
                          isSelected
                              ? PColors.primaryText(context).withAlpha(220)
                              : PColors.primaryText(context).withAlpha(150),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: PSize.arw(context, 12)),
            Container(
              width: PSize.arw(context, 24),
              height: PSize.arw(context, 24),
              decoration: BoxDecoration(
                // color: PColors.primary(context),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: PColors.primaryText(context),
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? Container(
                        width: PSize.arw(context, 24),
                        height: PSize.arw(context, 24),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: PColors.primaryText(context),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }
}
