import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/Utils/helpers/helper.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/models/activity_level_model.dart';
import 'package:instant_trainer/models/exercise_intensity_model.dart';
import 'package:instant_trainer/models/step_count_model.dart';
import 'package:instant_trainer/screens/onboarding/onboarding_screen6.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnboardingScreen5 extends StatefulWidget {
  const OnboardingScreen5({super.key});

  @override
  State<OnboardingScreen5> createState() => _OnboardingScreen5State();
}

class _OnboardingScreen5State extends State<OnboardingScreen5> {
  final controller = Get.find<OnboardingController>();
  bool invalidSteps = false;
  void onContinue() {
    if (controller.selectedExerciseIntensity.value.name == null) {
      PHelper.showErrorMessageGet(
        title: "Please select exercise intensity",
        message: "Please select exercise intensity",
      );
      return;
    }

    if (controller.isStepTracking.value) {
      if (controller.selectedStepCount.value.name == null) {
        PHelper.showErrorMessageGet(
          title: "Please select step count",
          message: "Please select step count",
        );
        return;
      }
    }

    PNavigate.to(OnboardingScreen6());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(color: PColors.background(context)),
        child: SingleChildScrollView(
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
                          '5 of 6',
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
                'How often do you exercise?',
                style: TextStyle(
                  fontSize: PSize.arw(context, 18),
                  color: PColors.primaryText(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: PSize.arh(context, 4)),
              Text(
                "This helps us understand how much activity you do in a week.",
                style: TextStyle(
                  fontSize: PSize.arw(context, 14),
                  color: PColors.primaryText(context).withAlpha(150),
                  fontWeight: FontWeight.w400,
                ),
              ),

              ListView.builder(
                itemCount: ActivityLevelModel.activityLevels.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 18),
                itemBuilder: (context, index) {
                  return Obx(
                    () => ExerciseIntensityCardWidget(
                      diet: ExerciseIntensityModel.exerciseIntensities[index],
                      isSelected:
                          controller.selectedExerciseIntensity.value ==
                                  ExerciseIntensityModel
                                      .exerciseIntensities[index]
                              ? true
                              : false,
                      onTap: () {
                        controller.selectedExerciseIntensity.value =
                            ExerciseIntensityModel.exerciseIntensities[index];
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: PSize.arh(context, 20)),
              Row(
                children: [
                  Text(
                    'Do you track your daily steps?',
                    style: TextStyle(
                      fontSize: PSize.arw(context, 18),
                      color: PColors.primaryText(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  // yes or no button and no is  selected
                  Obx(
                    () => Row(
                      children: [
                        ChipButton(
                          text: 'Yes',
                          isSelected: controller.isStepTracking.value,
                          selectedTextColor: PColors.primaryText(context),
                          onTap: () {
                            controller.isStepTracking.value = true;
                          },
                        ),
                        const SizedBox(width: 12),
                        ChipButton(
                          text: 'No',
                          isSelected: !controller.isStepTracking.value,
                          selectedTextColor: PColors.primaryText(context),
                          onTap: () {
                            controller.isStepTracking.value = false;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: PSize.arh(context, 20)),
              Obx(
                () =>
                    controller.isStepTracking.value
                        ? Text(
                          'How many steps do you take in a day?',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 18),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                        : const SizedBox(),
              ),
              Obx(
                () =>
                    controller.isStepTracking.value
                        ? Text(
                          "This helps us understand how much activity you do in a week.",
                          style: TextStyle(
                            fontSize: PSize.arw(context, 14),
                            color: PColors.primaryText(context).withAlpha(150),
                            fontWeight: FontWeight.w400,
                          ),
                        )
                        : const SizedBox(),
              ),
              SizedBox(height: PSize.arh(context, 8)),
              Obx(
                () => Visibility(
                  visible: controller.isStepTracking.value,
                  child: ListView.builder(
                    itemCount: ActivityLevelModel.activityLevels.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 18),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => StepCountCardWidget(
                          data: StepCountModel.stepCountList[index],
                          isSelected:
                              controller.selectedStepCount.value ==
                                      StepCountModel.stepCountList[index]
                                  ? true
                                  : false,
                          onTap: () {
                            controller.selectedStepCount.value =
                                StepCountModel.stepCountList[index];
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: PSize.arh(context, 20)),
            ],
          ),
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

class ChipButton extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;
  final String? text;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;

  const ChipButton({
    super.key,
    this.isSelected = false,
    this.onTap,

    this.text,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? selectedColor ?? PColors.primary(context)
                  : unselectedColor ??
                      PColors.primaryText(context).withAlpha(18),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text ?? "Yes",
          style: TextStyle(
            fontSize: PSize.arw(context, 16),
            color:
                isSelected
                    ? selectedTextColor ?? PColors.background(context)
                    : unselectedTextColor ?? PColors.primaryText(context),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class ExerciseIntensityCardWidget extends StatelessWidget {
  const ExerciseIntensityCardWidget({
    super.key,
    required this.diet,
    this.isSelected = false,
    required this.onTap,
  });
  final bool isSelected;
  final void Function() onTap;
  final ExerciseIntensityModel diet;

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

class StepCountCardWidget extends StatelessWidget {
  const StepCountCardWidget({
    super.key,
    required this.data,
    this.isSelected = false,
    required this.onTap,
  });
  final bool isSelected;
  final void Function() onTap;
  final StepCountModel data;

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
                    data.name ?? "",
                    style: TextStyle(
                      fontSize: PSize.arw(context, 18),
                      color: PColors.primaryText(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // SizedBox(height: PSize.arh(context, 4)),
                  // Text(
                  //   diet.description ?? "",
                  //   style: TextStyle(
                  //     fontSize: PSize.arw(context, 14),
                  //     color:
                  //         isSelected
                  //             ? PColors.primaryText(context).withAlpha(220)
                  //             : PColors.primaryText(context).withAlpha(150),
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(width: PSize.arw(context, 12)),
            ZoomTapAnimation(
              onTap: () {
                // Handle selection
                // You can use the index to identify the selected diet
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
