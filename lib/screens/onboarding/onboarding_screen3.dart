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
  List<FitnessGoalModel> fitnessGoals = [
    FitnessGoalModel(
      title: "Lose Weight",
      description:
          "Focus on reducing body fat through a calorie deficit, cardio, and light strength training.",
      prompt:
          "The user wants to lose weight. Recommend a diet and exercise plan suitable for fat loss and calorie deficit.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Build Muscle",
      description:
          "Emphasizes resistance training and a protein-rich diet to gain muscle mass.",
      prompt:
          "The user wants to build muscle. Recommend a high-protein diet and strength training routine.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Maintain Weight",
      description:
          "Balanced plan to maintain current weight with steady physical activity and healthy eating.",
      prompt:
          "The user wants to maintain their current weight. Suggest a balanced diet and a moderate exercise plan.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Gain Weight",
      description:
          "Targets healthy weight gain with calorie surplus, high-protein meals, and strength training.",
      prompt:
          "The user wants to gain weight. Suggest a calorie surplus diet with strength training.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Improve Endurance",
      description:
          "Boost stamina and cardiovascular health with aerobic exercises and a nutrient-dense diet.",
      prompt:
          "The user wants to improve endurance. Recommend a diet to support stamina and cardio workouts.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Increase Strength",
      description:
          "Build overall strength with progressive overload training and a high-protein, balanced diet.",
      prompt:
          "The user wants to increase strength. Provide a strength training plan and a high-protein diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Improve Flexibility",
      description:
          "Focus on yoga, stretching, and mobility routines to enhance joint and muscle flexibility.",
      prompt:
          "The user wants to improve flexibility. Suggest stretching and mobility exercises with a light diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Improve Overall Fitness",
      description:
          "A holistic approach combining strength, endurance, and flexibility for general wellness.",
      prompt:
          "The user wants to improve overall fitness. Recommend a balanced plan with varied workouts and diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Rehabilitation / Recovery",
      description:
          "Gentle workouts and nutrition plans for recovery after injury or surgery.",
      prompt:
          "The user is recovering from an injury or surgery. Suggest a mild workout and a recovery-focused diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Boost Immunity",
      description:
          "Focus on anti-inflammatory foods and moderate activity to support immune health.",
      prompt:
          "The user wants to boost immunity. Recommend an immunity-boosting diet and moderate exercises.",
      imageUrl: "",
    ),
  ];

  final controller = Get.find<OnboardingController>();

  void onContinue() {
    if (controller.selectedFitnessGoat.value.title == null) {
      PHelper.showErrorMessageGet(
        title: "Please select a fitness goal",
        message: "Select a fitness goal to continue",
      );
    } else {
      // Navigate to the next screen
      PNavigate.to(OnboardingScreen4());
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
                itemCount: fitnessGoals.length,
                shrinkWrap: false,
                padding: const EdgeInsets.only(top: 18),
                itemBuilder: (context, index) {
                  return Obx(
                    () => FitnessGoalCardWidget(
                      diet: fitnessGoals[index],
                      isSelected:
                          controller.selectedFitnessGoat.value ==
                                  fitnessGoals[index]
                              ? true
                              : false,
                      onTap: () {
                        controller.selectedFitnessGoat.value =
                            fitnessGoals[index];
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
            ZoomTapAnimation(
              onTap: () {
                // Handle selection
                // You can use the index to identify the selected diet
                print("Selected diet: ${diet.title}");
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
