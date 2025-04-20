class ActivityLevelModel {
  String? name;
  String? description;
  String? prompt;
  double? multiplier;
  String? imageUrl;

  ActivityLevelModel({
    this.name,
    this.description,
    this.prompt,
    this.multiplier,
  });

  ActivityLevelModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    prompt = json['prompt'];
    multiplier = json['multiplier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['prompt'] = prompt;
    data['multiplier'] = multiplier;
    return data;
  }

  @override
  String toString() {
    return 'ActivityLevelModel{name: $name, description: $description, prompt: $prompt, multiplier: $multiplier}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActivityLevelModel &&
        other.name == name &&
        other.description == description &&
        other.prompt == prompt &&
        other.multiplier == multiplier;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        prompt.hashCode ^
        multiplier.hashCode;
  }
  // Sample data for activity levels

  static List<ActivityLevelModel> activityLevels = [
    ActivityLevelModel(
      name: "Sedentary",
      description:
          "Little or no physical activity (e.g., desk job, minimal movement).",
      prompt: "I have a sedentary lifestyle with minimal physical activity.",
      multiplier: 1.2,
    ),
    ActivityLevelModel(
      name: "Lightly Active",
      description:
          "Light daily activity like casual walking or light housework.",
      prompt: "I am lightly active with casual daily movement.",
      multiplier: 1.375,
    ),
    ActivityLevelModel(
      name: "Moderately Active",
      description: "Regular physical activity or walks 3–5 times per week.",
      prompt: "I am moderately active with regular physical activity.",
      multiplier: 1.55,
    ),
    ActivityLevelModel(
      name: "Very Active",
      description: "Intense workouts or physically demanding job.",
      prompt:
          "I am very active and exercises intensely or works a physical job.",
      multiplier: 1.725,
    ),
    ActivityLevelModel(
      name: "Super Active",
      description: "Very intense workouts or daily training (e.g., athletes).",
      prompt: "I have a super active lifestyle with daily intense training.",
      multiplier: 1.9,
    ),
  ];
}
