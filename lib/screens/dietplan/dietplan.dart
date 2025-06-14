import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instant_trainer/APIs/api_functions.dart';
import 'package:instant_trainer/Utils/helpers/helper.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/storage/local_storage.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/screens/dashboard/dashboard_screen.dart';
import 'package:instant_trainer/screens/onboarding/onboarding_screen1.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DietplanScreen extends StatefulWidget {
  final Map<String, dynamic> dietPlanData;
  const DietplanScreen({super.key, required this.dietPlanData});

  @override
  State<DietplanScreen> createState() => _DietplanScreenState();
}

class _DietplanScreenState extends State<DietplanScreen> {
  final controller = Get.find<OnboardingController>();
  RxBool isLoading = false.obs;
  Map<String, dynamic> dietPlan = {};
  Map<String, dynamic> promptData = {};

  void regenerateDietPlan() async {
    promptData = LocalStorage().getData('dietPlanPrompt') ?? {};
    // log('Prompt Data: $promptData');

    if (promptData.isEmpty) {
      PHelper.showErrorMessageGet(
        title: "Prompt is missing",
        message: 'Propt is missing. Please try again.',
      );
      return;
    }

    isLoading.value = true;

    Map<String, dynamic> newDietPlan = await tGetDietPlan(promptData['prompt']);

    if (newDietPlan['isSuccess'] == false) {
      isLoading.value = false;
      PHelper.showErrorMessageGet(
        title: "Unable to generate diet plan",
        message: newDietPlan['error'],
      );
      return;
    }

    controller.generatedDietPlan.value = newDietPlan;

    dietPlan = jsonDecode(
      controller.generatedDietPlan.value['choices'][0]['message']['content']
          .split('```')[1]
          .replaceAll('json', ''),
    );
    isLoading.value = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // copy to clipboard
    // Clipboard.setData(
    //   ClipboardData(text: controller.generatedDietPlan.values.toString()),
    // );

    dataParsingToMap().then((e) {
      LocalStorage().saveData('dietPlan', controller.generatedDietPlan);
    });
  }

  Future<void> dataParsingToMap() async {
    log('Diet Plan: ${controller.generatedDietPlan.toString()}');
    controller.generatedDietPlan.value = widget.dietPlanData;
    dietPlan = jsonDecode(
      controller.generatedDietPlan['choices'][0]['message']['content']
          .split('```')[1]
          .replaceAll('json', ''),
    );
    promptData = LocalStorage().getData('dietPlanPrompt') ?? {};
    log('Diet Plan: ${dietPlan.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.background(context),
      // bottomNavigationBar:

      //  Container(
      //   color: PColors.background(context),
      //   height: PSize.arh(context, 72),
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 18.0, left: 18.0, bottom: 20.0),
      //     child: ZoomTapAnimation(
      //       onTap: () {
      // LocalStorage().saveData('dietPlan', controller.generatedDietPlan);
      //         PNavigate.materialToRight(DashboardScreen());
      //       },
      //       child: Container(
      //         height: PSize.arh(context, 54),
      //         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      //         decoration: BoxDecoration(
      //           color: PColors.primary(context),
      //           borderRadius: BorderRadius.circular(18),
      //         ),

      //         child: Row(
      //           children: [
      //             Icon(Icons.save_rounded, color: PColors.primaryTextDark),
      //             Spacer(),
      //             Text(
      //               'Save & Continue',
      //               style: TextStyle(
      //                 fontSize: PSize.arw(context, 14),
      //                 color: PColors.primaryTextDark,
      //                 fontWeight: FontWeight.w700,
      //               ),
      //             ),
      //             Spacer(),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SafeArea(
              child: Container(
                width: PSize.displayWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: false,
                      child: ZoomTapAnimation(
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
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Diet Plan',
                      style: TextStyle(
                        fontSize: PSize.arw(context, 24),
                        color: PColors.primaryText(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: ZoomTapAnimation(
                        onTap: () {
                          // regenerate diet plan
                          regenerateDietPlan();
                        },
                        child: Container(
                          height: PSize.arh(context, 54),
                          width: PSize.arw(context, 150),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 18,
                          ),
                          decoration: BoxDecoration(
                            color: PColors.primaryText(context),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.refresh_rounded,
                                color: PColors.background(context),
                              ),
                              Spacer(),
                              Text(
                                'Regenerate',
                                style: TextStyle(
                                  fontSize: PSize.arw(context, 14),
                                  color: PColors.background(context),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Daily Nutrition targate Breakdown',
                style: TextStyle(
                  fontSize: PSize.arw(context, 20),
                  color: PColors.primaryText(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'This is your daily nutrition target breakdown. You can track your daily intake of calories, protein, carbs, fats, and fiber.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: PSize.arw(context, 16),
                  color: PColors.primaryText(context),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 12),
            Skeletonizer(
              enabled: isLoading.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: PSize.arw(context, 44),
                          height: PSize.arh(context, 44),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: PColors.primaryText(context),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            child: Text(
                              '${dietPlan['nutrition_breakdown']['calories']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 18),
                                color: PColors.background(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Calories',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 16),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: PSize.arw(context, 44),
                          height: PSize.arh(context, 44),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: PColors.primaryText(context),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            child: Text(
                              '${dietPlan['nutrition_breakdown']['protein']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 18),
                                color: PColors.background(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Protein',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 16),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: PSize.arw(context, 44),
                          height: PSize.arh(context, 44),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: PColors.primaryText(context),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            child: Text(
                              '${dietPlan['nutrition_breakdown']['carbohydrates']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 18),
                                color: PColors.background(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Carbs',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 16),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: PSize.arw(context, 44),
                          height: PSize.arh(context, 44),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: PColors.primaryText(context),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            child: Text(
                              '${dietPlan['nutrition_breakdown']['fats']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 18),
                                color: PColors.background(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Fats',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 16),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: PSize.arw(context, 44),
                          height: PSize.arh(context, 44),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: PColors.primaryText(context),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            child: Text(
                              '${dietPlan['nutrition_breakdown']['fiber']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 18),
                                color: PColors.background(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Fiber',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 16),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: PSize.arw(context, 44),
                          height: PSize.arh(context, 44),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: PColors.primaryText(context),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FittedBox(
                            child: Text(
                              '${dietPlan['water_intake']['amount'].split(' ')[0]}L',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 18),
                                color: PColors.background(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Water',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 16),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: Skeletonizer(
                enabled: isLoading.value,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  decoration: BoxDecoration(
                    color: PColors.containerSecondary(context).withAlpha(20),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: PColors.primaryText(context).withAlpha(20),
                      width: 2,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Breakfast •',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' ${dietPlan['daily_plan']['breakfast']['time']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primary(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            // items
                            Text(
                              '${dietPlan['daily_plan']['breakfast']['items'].length} items',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 16),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        MealCardWidget(
                          items: dietPlan['daily_plan']['breakfast']['items'],
                          calories:
                              '${dietPlan['daily_plan']['breakfast']['calories']}',
                          protein:
                              '${dietPlan['daily_plan']['breakfast']['protein']}',
                          carbohydrates:
                              '${dietPlan['daily_plan']['breakfast']['carbohydrates']}',
                          fats:
                              '${dietPlan['daily_plan']['breakfast']['fats']}',
                          fiber:
                              '${dietPlan['daily_plan']['breakfast']['fiber']}',
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: PSize.displayWidth(context),
                          height: PSize.arh(context, 40),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Mid Morning Snack •',
                                      style: TextStyle(
                                        fontSize: PSize.arw(context, 20),
                                        color: PColors.primaryText(context),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      ' ${dietPlan['daily_plan']['mid_morning_snack']['time']}',
                                      style: TextStyle(
                                        fontSize: PSize.arw(context, 20),
                                        color: PColors.primary(context),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                // const Spacer(),
                                // items
                                Text(
                                  '${dietPlan['daily_plan']['mid_morning_snack']['items'].length} items',
                                  style: TextStyle(
                                    fontSize: PSize.arw(context, 16),
                                    color: PColors.primaryText(context),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        MealCardWidget(
                          items:
                              dietPlan['daily_plan']['mid_morning_snack']['items'],
                          calories:
                              '${dietPlan['daily_plan']['mid_morning_snack']['calories']}',
                          protein:
                              '${dietPlan['daily_plan']['mid_morning_snack']['protein']}',
                          carbohydrates:
                              '${dietPlan['daily_plan']['mid_morning_snack']['carbohydrates']}',
                          fats:
                              '${dietPlan['daily_plan']['mid_morning_snack']['fats']}',
                          fiber:
                              '${dietPlan['daily_plan']['mid_morning_snack']['fiber']}',
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Lunch •',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' ${dietPlan['daily_plan']['lunch']['time']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primary(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            // items
                            Text(
                              '${dietPlan['daily_plan']['lunch']['items'].length} items',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 16),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        MealCardWidget(
                          items: dietPlan['daily_plan']['lunch']['items'],
                          calories:
                              '${dietPlan['daily_plan']['lunch']['calories']}',
                          protein:
                              '${dietPlan['daily_plan']['lunch']['protein']}',
                          carbohydrates:
                              '${dietPlan['daily_plan']['lunch']['carbohydrates']}',
                          fats: '${dietPlan['daily_plan']['lunch']['fats']}',
                          fiber: '${dietPlan['daily_plan']['lunch']['fiber']}',
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Evening Snack •',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' ${dietPlan['daily_plan']['evening_snack']['time']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primary(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            // items
                            Text(
                              '${dietPlan['daily_plan']['evening_snack']['items'].length} items',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 16),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        MealCardWidget(
                          items:
                              dietPlan['daily_plan']['evening_snack']['items'],
                          calories:
                              '${dietPlan['daily_plan']['evening_snack']['calories']}',
                          protein:
                              '${dietPlan['daily_plan']['evening_snack']['protein']}',
                          carbohydrates:
                              '${dietPlan['daily_plan']['evening_snack']['carbohydrates']}',
                          fats:
                              '${dietPlan['daily_plan']['evening_snack']['fats']}',
                          fiber:
                              '${dietPlan['daily_plan']['evening_snack']['fiber']}',
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Dinner •',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' ${dietPlan['daily_plan']['dinner']['time']}',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primary(context),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            // items
                            Text(
                              '${dietPlan['daily_plan']['dinner']['items'].length} items',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 16),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        MealCardWidget(
                          items: dietPlan['daily_plan']['dinner']['items'],
                          calories:
                              '${dietPlan['daily_plan']['dinner']['calories']}',
                          protein:
                              '${dietPlan['daily_plan']['dinner']['protein']}',
                          carbohydrates:
                              '${dietPlan['daily_plan']['dinner']['carbohydrates']}',
                          fats: '${dietPlan['daily_plan']['dinner']['fats']}',
                          fiber: '${dietPlan['daily_plan']['dinner']['fiber']}',
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'Supplements ',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 20),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const Spacer(),
                            // items
                            Text(
                              '${dietPlan['daily_plan']['supplements'].length} items',
                              style: TextStyle(
                                fontSize: PSize.arw(context, 16),
                                color: PColors.primaryText(context),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ...List.generate(
                          dietPlan['daily_plan']['supplements'].length,
                          (index) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: PColors.containerSecondary(context),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 6,
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: PSize.arw(context, 54),
                                  height: PSize.arh(context, 54),
                                  decoration: BoxDecoration(
                                    color: PColors.primaryText(context),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        fontSize: PSize.arw(context, 18),
                                        color: PColors.background(context),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        dietPlan['daily_plan']['supplements'][index]['name'],
                                        style: TextStyle(
                                          fontSize: PSize.arw(context, 24),
                                          color: PColors.primaryText(context),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      Text(
                                        dietPlan['daily_plan']['supplements'][index]['purpose'],
                                        style: TextStyle(
                                          fontSize: PSize.arw(context, 16),
                                          color: PColors.primaryText(context),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        dietPlan['daily_plan']['supplements'][index]['timing'],
                                        style: TextStyle(
                                          fontSize: PSize.arw(context, 16),
                                          color: PColors.primary(context),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealCardWidget extends StatelessWidget {
  final List items;
  final String calories;
  final String protein;
  final String carbohydrates;
  final String fats;
  final String fiber;

  const MealCardWidget({
    super.key,
    required this.items,
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fats,
    required this.fiber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: PColors.success.withAlpha(30),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 20),
          ...List.generate(
            items.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 6,
              ),
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: PSize.arw(context, 20),
                  color: PColors.primaryText(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            decoration: BoxDecoration(
              // color: PColors.primary(context),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: PSize.arw(context, 54),
                      height: PSize.arh(context, 54),
                      decoration: BoxDecoration(
                        color: PColors.primaryText(context),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          calories,
                          style: TextStyle(
                            fontSize: PSize.arw(context, 18),
                            color: PColors.background(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Calories',
                      style: TextStyle(
                        fontSize: PSize.arw(context, 16),
                        color: PColors.primaryText(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: PSize.arw(context, 54),
                      height: PSize.arh(context, 54),
                      decoration: BoxDecoration(
                        color: PColors.primaryText(context),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          protein,
                          style: TextStyle(
                            fontSize: PSize.arw(context, 18),
                            color: PColors.background(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Protein',
                      style: TextStyle(
                        fontSize: PSize.arw(context, 16),
                        color: PColors.primaryText(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: PSize.arw(context, 54),
                      height: PSize.arh(context, 54),
                      decoration: BoxDecoration(
                        color: PColors.primaryText(context),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          carbohydrates,
                          style: TextStyle(
                            fontSize: PSize.arw(context, 18),
                            color: PColors.background(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Carbs',
                      style: TextStyle(
                        fontSize: PSize.arw(context, 16),
                        color: PColors.primaryText(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: PSize.arw(context, 54),
                      height: PSize.arh(context, 54),
                      decoration: BoxDecoration(
                        color: PColors.primaryText(context),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          fats,
                          style: TextStyle(
                            fontSize: PSize.arw(context, 18),
                            color: PColors.background(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Fats',
                      style: TextStyle(
                        fontSize: PSize.arw(context, 16),
                        color: PColors.primaryText(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: PSize.arw(context, 54),
                      height: PSize.arh(context, 54),
                      decoration: BoxDecoration(
                        color: PColors.primaryText(context),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          fiber,
                          style: TextStyle(
                            fontSize: PSize.arw(context, 18),
                            color: PColors.background(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Fiber',
                      style: TextStyle(
                        fontSize: PSize.arw(context, 16),
                        color: PColors.primaryText(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
