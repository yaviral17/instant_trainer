class FitnessGoalModel {
  String? title;
  String? description;
  String? imageUrl;
  String? prompt;

  FitnessGoalModel({this.title, this.description, this.imageUrl, this.prompt});

  FitnessGoalModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    prompt = json['prompt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['prompt'] = prompt;
    return data;
  }

  @override
  String toString() {
    return 'FitnessGoalModel{title: $title, description: $description, imageUrl: $imageUrl, prompt: $prompt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FitnessGoalModel &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.prompt == prompt;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        prompt.hashCode;
  }

  static List<FitnessGoalModel> fitnessGoals = [
    FitnessGoalModel(
      title: "Lose Weight",
      description:
          "Focus on reducing body fat through a calorie deficit, cardio, and light strength training.",
      prompt:
          "I wants to lose weight. Recommend a diet and exercise plan suitable for fat loss and calorie deficit.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Build Muscle",
      description:
          "Emphasizes resistance training and a protein-rich diet to gain muscle mass.",
      prompt:
          "I wants to build muscle. Recommend a high-protein diet and strength training routine.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Maintain Weight",
      description:
          "Balanced plan to maintain current weight with steady physical activity and healthy eating.",
      prompt:
          "I wants to maintain their current weight. Suggest a balanced diet and a moderate exercise plan.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Gain Weight",
      description:
          "Targets healthy weight gain with calorie surplus, high-protein meals, and strength training.",
      prompt:
          "I wants to gain weight. Suggest a calorie surplus diet with strength training.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Improve Endurance",
      description:
          "Boost stamina and cardiovascular health with aerobic exercises and a nutrient-dense diet.",
      prompt:
          "I wants to improve endurance. Recommend a diet to support stamina and cardio workouts.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Increase Strength",
      description:
          "Build overall strength with progressive overload training and a high-protein, balanced diet.",
      prompt:
          "I wants to increase strength. Provide a strength training plan and a high-protein diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Improve Flexibility",
      description:
          "Focus on yoga, stretching, and mobility routines to enhance joint and muscle flexibility.",
      prompt:
          "I wants to improve flexibility. Suggest stretching and mobility exercises with a light diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Improve Overall Fitness",
      description:
          "A holistic approach combining strength, endurance, and flexibility for general wellness.",
      prompt:
          "I wants to improve overall fitness. Recommend a balanced plan with varied workouts and diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Rehabilitation / Recovery",
      description:
          "Gentle workouts and nutrition plans for recovery after injury or surgery.",
      prompt:
          "I is recovering from an injury or surgery. Suggest a mild workout and a recovery-focused diet.",
      imageUrl: "",
    ),
    FitnessGoalModel(
      title: "Boost Immunity",
      description:
          "Focus on anti-inflammatory foods and moderate activity to support immune health.",
      prompt:
          "I wants to boost immunity. Recommend an immunity-boosting diet and moderate exercises.",
      imageUrl: "",
    ),
  ];
}
