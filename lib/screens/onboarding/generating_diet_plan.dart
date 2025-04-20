import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/APIs/api_functions.dart';
import 'package:instant_trainer/APIs/ollama_service_api.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/enums/supliments_prefrence_enum.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GeneratingDietPlan extends StatefulWidget {
  const GeneratingDietPlan({super.key});

  @override
  State<GeneratingDietPlan> createState() => _GeneratingDietPlanState();
}

class _GeneratingDietPlanState extends State<GeneratingDietPlan> {
  final controller = Get.find<OnboardingController>();

  RxBool isLoading = true.obs;

  Future<Map<String, dynamic>?> _generateDietPlan() async {
    isLoading.value = true;

    String prompt = '''
You are a professional AI dietician and fitness expert. Based on the user information provided below, generate a detailed daily diet plan that suits their body, preferences, and goals.

### USER PROFILE
- Name: ${controller.nameController.text.trim()} 
- Age: ${controller.ageController.text.trim()} years
- Gender: ${controller.isMale.value ? "Male" : "Female"}
- Weight: ${controller.weightController.text} kg
- Height: ${controller.heightController.text} cm

### DIETARY PREFERENCE
${controller.selectedDiet.value.prompt}

### FITNESS GOAL
${controller.selectedFitnessGoat.value.prompt}

### PHYSICAL ACTIVITY
- Daily Activity Level: ${controller.selectedActivityLevel.value.prompt}
- Exercise Frequency per Week: ${controller.selectedExerciseIntensity.value.prompt}
- Average Daily Steps: ${controller.isStepTracking.value ? controller.selectedStepCount.value.prompt : "Not Tracking"}
- Estimated Calories Burned per Day: Estimated calories burned per day: ${controller.estimateTDEE().toStringAsFixed(0)} kcal

### FINANCIAL PREFERENCE
- Monthly Budget for Diet: ${controller.selectedSpending.value.prompt}
- Open to Supplements: ${supplementPrompt(controller.selectedSupplementPreference.value)}

---

Please generate a structured JSON response with the following format:

```json
{
  "daily_plan": {
    "breakfast": {
      "time": "8:00 AM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"

    },
    "mid_morning_snack": {
      "time": "10:30 AM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"

    },
    "lunch": {
      "time": "1:00 PM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
    },
    "evening_snack": {
      "time": "4:30 PM",
      "items": ["...", "..."],
    "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
    },
    "dinner": {
      "time": "7:30 PM",
      "items": ["...", "..."],
      "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
    },
    "supplements": [
      {
        "name": "...",
        "purpose": "...",
        "timing": "..."
      }
    ]
  },
  "total_daily_calories": 1550,
  "nutrition_breakdown": {
    "calories": 300,
      "protein": "20g",
      "carbohydrates": "40g",
      "fats": "10g",
      "fiber": "5g"
  },
  "water_intake": {
    "amount": "2.5 liters",
    "notes": "Drink water throughout the day."
  },
}
''';

    Get.log('Prompt: $prompt');

    Map<String, dynamic> response = await tGetDietPlan(prompt);

    Get.log('Response: $response');
    isLoading.value = false;
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/generating_diet_bg.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  width: PSize.arw(context, 360),
                  height: PSize.arw(context, 360),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: PColors.primaryTextDark,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Obx(
                    () => FutureBuilder(
                      future: _generateDietPlan(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            isLoading.value) {
                          return Column(
                            children: [
                              Spacer(),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 400),

                                padding: EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: PColors.primary(context).withAlpha(36),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: LoadingAnimationWidget.waveDots(
                                  color: PColors.primary(context),
                                  size: 36,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: FittedBox(
                                  child: Text(
                                    'Generating your diet plan',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: PColors.primaryTextLight,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: PSize.arh(context, 6)),
                              FittedBox(
                                child: Text(
                                  'We are generating a personalized diet plan for\nyou based on your preferences and goals.\n This may take a few moments.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: PColors.searchtextFieldLight,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Spacer(),

                              // ZoomTapAnimation(
                              //   child: Container(
                              //     width: PSize.displayWidth(context),
                              //     height: PSize.arh(context, 56),
                              //     decoration: BoxDecoration(
                              //       color: PColors.backgroundDark,
                              //       borderRadius: BorderRadius.circular(18),
                              //     ),
                              //     child: Row(
                              //       mainAxisSize: MainAxisSize.max,
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         Text(
                              //           'Continue',
                              //           style: TextStyle(
                              //             fontSize: PSize.arw(context, 20),
                              //             color: PColors.primaryTextDark,
                              //             fontWeight: FontWeight.w600,
                              //           ),
                              //         ),
                              //         SizedBox(width: PSize.arw(context, 10)),
                              //         Icon(
                              //           Icons.arrow_forward_rounded,
                              //           color: PColors.primaryTextDark,
                              //           size: PSize.arw(context, 24),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          );
                        }
                        if (snapshot.data!['isSuccess'] == false) {
                          return Column(
                            children: [
                              Spacer(),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 400),

                                padding: EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: PColors.error.withAlpha(36),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  Icons.error,
                                  color: PColors.error,
                                  size: 36,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: FittedBox(
                                  child: Text(
                                    'Error generating diet plan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: PColors.primary(context),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: PSize.arh(context, 6)),
                              FittedBox(
                                child: Text(
                                  'Error: ${snapshot.data!['error']}\n\nThere was an error generating your diet plan.\n Please try again later.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: PColors.searchtextFieldLight,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            Spacer(),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 400),

                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: PColors.success.withAlpha(36),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.check_circle,
                                color: PColors.success,
                                size: 36,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                              ),
                              child: FittedBox(
                                child: Text(
                                  'Diet plan generated\nsuccessfully',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: PColors.primary(context),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: PSize.arh(context, 6)),
                            FittedBox(
                              child: Text(
                                'Your personalized diet plan has been generated.\n You can now view and customize it as per your needs.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: PColors.searchtextFieldLight,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Spacer(),
                            ZoomTapAnimation(
                              child: Container(
                                width: PSize.displayWidth(context),
                                height: PSize.arh(context, 56),
                                decoration: BoxDecoration(
                                  color: PColors.backgroundDark,
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
                                        color: PColors.primaryTextDark,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: PSize.arw(context, 10)),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: PColors.primaryTextDark,
                                      size: PSize.arw(context, 24),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
