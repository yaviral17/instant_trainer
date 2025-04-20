import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/Utils/helpers/helper.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/models/activity_level_model.dart';
import 'package:instant_trainer/screens/onboarding/onboarding_screen5.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnboardingScreen4 extends StatefulWidget {
  const OnboardingScreen4({super.key});

  @override
  State<OnboardingScreen4> createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  final controller = Get.find<OnboardingController>();

  void onContinue() {
    if (controller.selectedActivityLevel.value.name == null) {
      PHelper.showErrorMessageGet(
        title: 'Please select an activity level',
        message:
            'This will help us understand your activity level and suggest a suitable plan.',
      );
    } else {
      // Navigate to the next screen
      PNavigate.materialFade(OnboardingScreen5());
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
                        '4 of 6',
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
              'How active are you in a typical day?',
              style: TextStyle(
                fontSize: PSize.arw(context, 18),
                color: PColors.primaryText(context),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: PSize.arh(context, 4)),
            Text(
              'This will help us understand your activity level and suggest a suitable plan.',
              style: TextStyle(
                fontSize: PSize.arw(context, 14),
                color: PColors.primaryText(context).withAlpha(150),
                fontWeight: FontWeight.w400,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: ActivityLevelModel.activityLevels.length,
                shrinkWrap: false,
                padding: const EdgeInsets.only(top: 18),
                itemBuilder: (context, index) {
                  return Obx(
                    () => ActivityLevelCardWidget(
                      diet: ActivityLevelModel.activityLevels[index],
                      isSelected:
                          controller.selectedActivityLevel.value ==
                                  ActivityLevelModel.activityLevels[index]
                              ? true
                              : false,
                      onTap: () {
                        controller.selectedActivityLevel.value =
                            ActivityLevelModel.activityLevels[index];
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

class ActivityLevelCardWidget extends StatelessWidget {
  const ActivityLevelCardWidget({
    super.key,
    required this.diet,
    this.isSelected = false,
    required this.onTap,
  });
  final bool isSelected;
  final void Function() onTap;
  final ActivityLevelModel diet;

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
