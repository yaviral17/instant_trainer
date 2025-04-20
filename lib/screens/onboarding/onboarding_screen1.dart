import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:instant_trainer/Utils/helpers/helper.dart';
import 'package:instant_trainer/Utils/helpers/navigations.dart';
import 'package:instant_trainer/Utils/sizes.dart';
import 'package:instant_trainer/Utils/theme/colors.dart';
import 'package:instant_trainer/controllers/onboarding_controller.dart';
import 'package:instant_trainer/screens/onboarding/onboarding_screen2.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  FocusNode nameFocus = FocusNode();
  FocusNode ageFocus = FocusNode();
  FocusNode weightFocus = FocusNode();
  FocusNode heightFocus = FocusNode();
  FocusNode genderFocus = FocusNode();

  final OnboardingController onboardingController = Get.find();

  int age = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameFocus.requestFocus();
  }

  void onContinue() {
    if (onboardingController.nameController.text.trim().isEmpty) {
      PHelper.showErrorMessageGet(
        title: 'Name is required 🧐',
        // add emoji at the end of the message
        message: 'Please enter your full name',
      );
      nameFocus.requestFocus();
      return;
    }
    if (onboardingController.ageController.text.isEmpty) {
      PHelper.showErrorMessageGet(
        title: 'Age is required 🧐',
        message: 'Please enter your age',
      );
      ageFocus.requestFocus();
      return;
    }
    if (onboardingController.weightController.text.isEmpty) {
      PHelper.showErrorMessageGet(
        title: 'Weight is required 🧐',
        message: 'Please enter your weight',
      );
      weightFocus.requestFocus();
      return;
    }
    if (onboardingController.heightController.text.isEmpty) {
      PHelper.showErrorMessageGet(
        title: 'Height is required 🧐',
        message: 'Please enter your height',
      );
      heightFocus.requestFocus();
      return;
    }

    PNavigate.materialFade(OnboardingScreen2());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        decoration: BoxDecoration(color: PColors.background(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        '1 of 6',
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
            SizedBox(height: PSize.rh(context, 20)),
            Text(
              'Your full name',
              style: TextStyle(
                fontSize: PSize.arw(context, 18),
                color: PColors.primaryText(context),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: PSize.rh(context, 8)),
            TextField(
              focusNode: nameFocus,

              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]+$')),
              ],
              keyboardType: TextInputType.name,
              maxLength: 30,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              textDirection: TextDirection.ltr,
              controller: onboardingController.nameController,
              onChanged: (value) {
                setState(() {});
              },

              style: TextStyle(
                fontSize: PSize.arw(context, 20),
                color: PColors.primaryText(context),
                fontWeight: FontWeight.w400,
              ),

              decoration: InputDecoration(
                fillColor: PColors.primaryText(context).withAlpha(18),
                filled: true,
                hintText: 'John Doe',
                prefixIcon: Icon(
                  Iconsax.user,
                  color: PColors.secondaryText(context),
                  size: PSize.arw(context, 24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: PColors.primary(context).withAlpha(100),
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: PColors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(18),
                ),
                hintStyle: TextStyle(
                  fontSize: PSize.arw(context, 20),
                  color: PColors.secondaryText(context),
                  fontWeight: FontWeight.w400,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: PSize.rh(context, 12)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                          fontSize: PSize.arw(context, 18),
                          color: PColors.primaryText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: PSize.rh(context, 8)),
                      TextField(
                        focusNode: ageFocus,
                        controller: onboardingController.ageController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        onChanged: (value) {
                          setState(() {});
                        },
                        style: TextStyle(
                          fontSize: PSize.arw(context, 20),
                          color: PColors.primaryText(context),
                          fontWeight: FontWeight.w400,
                        ),
                        buildCounter: (
                          context, {
                          required currentLength,
                          required isFocused,
                          required maxLength,
                        }) {
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: PColors.primaryText(context).withAlpha(18),
                          filled: true,
                          hintText: '00',
                          prefixIcon: Icon(
                            Iconsax.user,
                            color: PColors.secondaryText(context),
                            size: PSize.arw(context, 24),
                          ),
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'years ',
                                style: TextStyle(
                                  fontSize: PSize.arw(context, 20),
                                  color: PColors.secondaryText(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PColors.primary(context).withAlpha(100),
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PColors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          hintStyle: TextStyle(
                            fontSize: PSize.arw(context, 20),
                            color: PColors.secondaryText(context),
                            fontWeight: FontWeight.w400,
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: PSize.arw(context, 18)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weight (kg)',
                        style: TextStyle(
                          fontSize: PSize.arw(context, 18),
                          color: PColors.primaryText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: PSize.rh(context, 8)),
                      TextField(
                        focusNode: weightFocus,
                        controller: onboardingController.weightController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        onChanged: (value) {
                          setState(() {});
                        },
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          fontSize: PSize.arw(context, 20),
                          color: PColors.primaryText(context),
                          fontWeight: FontWeight.w400,
                        ),
                        buildCounter: (
                          context, {
                          required currentLength,
                          required isFocused,
                          required maxLength,
                        }) {
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: PColors.primaryText(context).withAlpha(18),
                          filled: true,
                          hintText: '00',

                          prefixIcon: Icon(
                            Iconsax.user,
                            color: PColors.secondaryText(context),
                            size: PSize.arw(context, 24),
                          ),
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'kg',
                                style: TextStyle(
                                  fontSize: PSize.arw(context, 20),
                                  color: PColors.secondaryText(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PColors.primary(context).withAlpha(100),
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PColors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          hintStyle: TextStyle(
                            fontSize: PSize.arw(context, 20),
                            color: PColors.secondaryText(context),
                            fontWeight: FontWeight.w400,
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: PSize.rh(context, 12)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Height (cm)',
                        style: TextStyle(
                          fontSize: PSize.arw(context, 18),
                          color: PColors.primaryText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: PSize.rh(context, 8)),
                      TextField(
                        focusNode: heightFocus,
                        textInputAction: TextInputAction.done,
                        controller: onboardingController.heightController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        buildCounter: (
                          context, {
                          required currentLength,
                          required isFocused,
                          required maxLength,
                        }) {
                          return null;
                        },
                        style: TextStyle(
                          fontSize: PSize.arw(context, 20),
                          color: PColors.primaryText(context),
                          fontWeight: FontWeight.w400,
                        ),

                        decoration: InputDecoration(
                          fillColor: PColors.primaryText(context).withAlpha(18),
                          filled: true,
                          hintText: '00',
                          prefixIcon: Icon(
                            Iconsax.user,
                            color: PColors.secondaryText(context),
                            size: PSize.arw(context, 24),
                          ),
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'cm',
                                style: TextStyle(
                                  fontSize: PSize.arw(context, 20),
                                  color: PColors.secondaryText(context),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PColors.primary(context).withAlpha(100),
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PColors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          hintStyle: TextStyle(
                            fontSize: PSize.arw(context, 20),
                            color: PColors.secondaryText(context),
                            fontWeight: FontWeight.w400,
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: PSize.arw(context, 18)),
                Obx(
                  () => Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: PSize.arw(context, 18),
                            color: PColors.primaryText(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: PSize.rh(context, 8)),
                        Row(
                          children: [
                            Expanded(
                              child: ZoomTapAnimation(
                                onTap: () {
                                  onboardingController.isMale.value = true;
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  width: PSize.arw(context, 120),
                                  height: PSize.arh(context, 56),
                                  decoration: BoxDecoration(
                                    color:
                                        onboardingController.isMale.value
                                            ? PColors.primary(context)
                                            : PColors.primaryText(
                                              context,
                                            ).withAlpha(18),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                        fontSize: PSize.arw(context, 20),
                                        color:
                                            onboardingController.isMale.value
                                                ? PColors.primaryText(context)
                                                : PColors.secondaryText(
                                                  context,
                                                ),
                                        fontWeight:
                                            onboardingController.isMale.value
                                                ? FontWeight.w600
                                                : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: PSize.arw(context, 18)),
                            Expanded(
                              child: ZoomTapAnimation(
                                onTap: () {
                                  onboardingController.isMale.value = false;
                                },
                                child: Container(
                                  width: PSize.arw(context, 120),
                                  height: PSize.arh(context, 56),
                                  decoration: BoxDecoration(
                                    color:
                                        !onboardingController.isMale.value
                                            ? PColors.primary(context)
                                            : PColors.primaryText(
                                              context,
                                            ).withAlpha(18),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                        fontSize: PSize.arw(context, 20),
                                        color:
                                            !onboardingController.isMale.value
                                                ? PColors.primaryText(context)
                                                : PColors.secondaryText(
                                                  context,
                                                ),
                                        fontWeight:
                                            !onboardingController.isMale.value
                                                ? FontWeight.w600
                                                : FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: PSize.rh(context, 20)),
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
