import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instant_trainer/models/activity_level_model.dart';
import 'package:instant_trainer/models/diet_model.dart';
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

  final TextEditingController stepsCount = TextEditingController();
}
