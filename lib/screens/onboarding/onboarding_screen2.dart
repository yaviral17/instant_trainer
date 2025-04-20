import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/Utils/helpers/helper.dart';
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
  final controller = Get.find<OnboardingController>();

  void onContinue() {
    if (controller.selectedDiet.value.name == null) {
      PHelper.showErrorMessageGet(
        title: "Select a diet",
        message: "Please select a diet preference to continue.",
      );
      return;
    }

    PNavigate.materialFade(OnboardingScreen3());
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
                itemCount: DietModel.dietList.length,
                shrinkWrap: false,
                padding: const EdgeInsets.only(top: 18),
                itemBuilder: (context, index) {
                  return Obx(
                    () => DietCardWidget(
                      diet: DietModel.dietList[index],
                      isSelected:
                          controller.selectedDiet.value ==
                                  DietModel.dietList[index]
                              ? true
                              : false,
                      onTap: () {
                        controller.selectedDiet.value =
                            DietModel.dietList[index];
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
