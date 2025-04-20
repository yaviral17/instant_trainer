import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/models/diet_model.dart';
import 'package:instant_trainer/screens/onboarding/onboarding_screen3.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  List<DietModel> dietList = [
    DietModel(
      name: "Basic",
      description:
          "Includes all food groups. Suitable for people with no dietary restrictions.",
      imageUrl: "",
    ),
    DietModel(
      name: "Vegetarian",
      description: "Excludes meat and fish. Suitable for vegetarians.",
      imageUrl: "",
    ),
    DietModel(
      name: "Vegan",
      description: "Excludes all animal products. Suitable for vegans.",
      imageUrl: "",
    ),
    DietModel(
      name: "Pescatarian",
      description:
          "Excludes meat but includes fish. Suitable for pescatarians.",
      imageUrl: "",
    ),
    DietModel(
      name: "Flexitarian",
      description:
          "Primarily vegetarian with occasional meat or fish. Suitable for flexitarians.",
      imageUrl: "",
    ),
    DietModel(
      name: "Keto",
      description:
          "Low in carbohydrates, high in fat. Suitable for people on a ketogenic diet.",
      imageUrl: "",
    ),
    DietModel(
      name: "Paleo",
      description:
          "Based on foods eaten by early humans. Excludes processed foods and grains.",
      imageUrl: "",
    ),
    DietModel(
      name: "Mediterranean",
      description:
          "Emphasizes fruits, vegetables, fish, and olive oil. Heart-healthy and balanced.",
      imageUrl: "",
    ),
    DietModel(
      name: "DASH",
      description:
          "Designed to help lower blood pressure. Rich in fruits and vegetables.",
      imageUrl: "",
    ),
    DietModel(
      name: "Whole30",
      description:
          "30-day reset diet eliminating sugar, grains, dairy, and legumes.",
      imageUrl: "",
    ),
    DietModel(
      name: "Gluten-Free",
      description:
          "Excludes gluten. Suitable for people with gluten intolerance or celiac disease.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-FODMAP",
      description:
          "Low in fermentable carbs. Suitable for people with IBS or digestive issues.",
      imageUrl: "",
    ),
    DietModel(
      name: "Anti-Inflammatory",
      description:
          "Focuses on foods that reduce inflammation. Includes omega-3s and antioxidants.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-Sodium",
      description:
          "Limits salt intake. Suitable for people with high blood pressure.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-Cholesterol",
      description:
          "Reduces intake of saturated fats and cholesterol. Heart-friendly diet.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-Sugar",
      description:
          "Limits sugar. Suitable for people with diabetes or those trying to lose weight.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-Carb",
      description:
          "Reduces carbohydrate intake. Supports weight loss and blood sugar control.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-Fat",
      description: "Minimizes fat intake. Suitable for low-fat dietary goals.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-Calorie",
      description:
          "Reduces overall calorie consumption. Suitable for weight loss.",
      imageUrl: "",
    ),
    DietModel(
      name: "High-Protein",
      description: "Emphasizes protein for muscle building and satiety.",
      imageUrl: "",
    ),
    DietModel(
      name: "High-Fiber",
      description:
          "Includes high-fiber foods to support digestion and heart health.",
      imageUrl: "",
    ),
    DietModel(
      name: "Low-Glycemic",
      description: "Maintains stable blood sugar by focusing on low-GI foods.",
      imageUrl: "",
    ),
    DietModel(
      name: "Intermittent Fasting",
      description:
          "Focuses on meal timing (e.g., 16:8 fasting). Helps with weight and metabolism.",
      imageUrl: "",
    ),

    // Religious/Cultural Diets
    DietModel(
      name: "Halal",
      description:
          "Follows Islamic dietary laws. Excludes pork and alcohol. Meat must be halal-certified.",
      imageUrl: "",
    ),
    DietModel(
      name: "Kosher",
      description:
          "Follows Jewish dietary laws. Includes specific preparation and food combinations.",
      imageUrl: "",
    ),
    DietModel(
      name: "Satvik",
      description:
          "Vegetarian Indian diet that excludes onion, garlic, and processed food. Rooted in Ayurveda.",
      imageUrl: "",
    ),
    DietModel(
      name: "Jain",
      description:
          "Strict vegetarian diet excluding root vegetables and fermented foods.",
      imageUrl: "",
    ),
  ];

  final controller = Get.find<OnboardingController>();

  void onContinue() {
    if (controller.selectedDiet.value.name == null) {
      Get.snackbar(
        "Error",
        "Please select a diet preference",
        backgroundColor: PColors.primary(context),
        colorText: PColors.background(context),
      );
      return;
    }

    PNavigate.to(OnboardingScreen3());
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
                        '2 of 6',
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
              'Select your dietary preference',
              style: TextStyle(
                fontSize: PSize.arw(context, 18),
                color: PColors.primaryText(context),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: PSize.arh(context, 4)),
            Text(
              'We will use this information to provide you with the best possible experience.',
              style: TextStyle(
                fontSize: PSize.arw(context, 14),
                color: PColors.primaryText(context).withAlpha(150),
                fontWeight: FontWeight.w400,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: dietList.length,
                shrinkWrap: false,
                padding: const EdgeInsets.only(top: 18),
                itemBuilder: (context, index) {
                  return Obx(
                    () => DietCardWidget(
                      diet: dietList[index],
                      isSelected:
                          controller.selectedDiet.value == dietList[index]
                              ? true
                              : false,
                      onTap: () {
                        controller.selectedDiet.value = dietList[index];
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

class DietCardWidget extends StatelessWidget {
  const DietCardWidget({
    super.key,
    required this.diet,
    this.isSelected = false,
    required this.onTap,
  });
  final bool isSelected;
  final void Function() onTap;
  final DietModel diet;

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
                    diet.name ?? "",
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
                print("Selected diet: ${diet.name}");
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
