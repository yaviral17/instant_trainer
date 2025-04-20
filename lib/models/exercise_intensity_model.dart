class ExerciseIntensityModel {
  String? name;
  String? description;
  String? imageUrl;
  String? prompt;

  ExerciseIntensityModel({
    this.name,
    this.description,
    this.imageUrl,
    this.prompt,
  });

  ExerciseIntensityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    prompt = json['prompt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['prompt'] = prompt;
    return data;
  }

  @override
  String toString() {
    return 'ExerciseIntensityModel{name: $name, description: $description, imageUrl: $imageUrl, prompt: $prompt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciseIntensityModel &&
        other.name == name &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.prompt == prompt;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        prompt.hashCode;
  }

  //  Sample data for exercise intensities
  static List<ExerciseIntensityModel> exerciseIntensities = [
    ExerciseIntensityModel(
      name: "Never",
      description: "I don't exercise at all.",
      prompt: "User does not exercise at all.",
    ),
    ExerciseIntensityModel(
      name: "1-2 times a week",
      description:
          "I do light exercise (e.g., walking, yoga) 1-2 times a week.",
      prompt: "User does light exercise 1-2 times a week.",
    ),
    ExerciseIntensityModel(
      name: "3-4 times a week",
      description:
          "I do moderate exercise (e.g., jogging, cycling) 3-4 times a week.",
      prompt: "User does moderate exercise 3-4 times a week.",
    ),
    ExerciseIntensityModel(
      name: "5-6 times a week",
      description:
          "I do vigorous exercise (e.g., running, swimming) 5-6 times a week.",
      prompt: "User does vigorous exercise 5-6 times a week.",
    ),
    ExerciseIntensityModel(
      name: "Everyday",
      description:
          "I do intense exercise (e.g., HIIT, weightlifting) every day.",
      prompt: "User does intense exercise every day.",
    ),
  ];
}
