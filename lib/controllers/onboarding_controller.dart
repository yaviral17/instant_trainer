import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/enums/supliments_prefrence_enum.dart';
import 'package:instant_trainer/models/Spending_model.dart';
import 'package:instant_trainer/models/activity_level_model.dart';
import 'package:instant_trainer/models/diet_model.dart';
import 'package:instant_trainer/models/diet_plan_model.dart';
import 'package:instant_trainer/models/exercise_intensity_model.dart';
import 'package:instant_trainer/models/fitness_goal_model.dart';
import 'package:instant_trainer/models/step_count_model.dart';

class OnboardingController extends GetxController {
  RxBool isMale = true.obs;
  RxBool isStepTracking = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  Rx<DietModel> selectedDiet = DietModel().obs;
  Rx<FitnessGoalModel> selectedFitnessGoat = FitnessGoalModel().obs;
  Rx<ActivityLevelModel> selectedActivityLevel = ActivityLevelModel().obs;
  Rx<ExerciseIntensityModel> selectedExerciseIntensity =
      ExerciseIntensityModel().obs;
  Rx<StepCountModel> selectedStepCount = StepCountModel().obs;
  Rx<SpendingModel> selectedSpending = SpendingModel().obs;
  Rx<SupplementPreference> selectedSupplementPreference =
      SupplementPreference.maybe.obs;

  // generated diet plan
  RxMap<String, dynamic> generatedDietPlan = <String, dynamic>{}.obs;

  Rx<DietPlanModel> dietPlanModel = DietPlanModel().obs;

  double calculateBMR() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    int age = int.parse(ageController.text);

    if (isMale.value) {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.2 * height - 5 * age - 161;
    }
  }

  double estimateTDEE() {
    double bmr = calculateBMR();

    return bmr *
        (selectedActivityLevel.value.multiplier! +
            (isStepTracking.value ? selectedStepCount.value.multiplier! : 0));
  }
}
