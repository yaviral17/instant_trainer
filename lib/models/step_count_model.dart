class StepCountModel {
  String? name;
  String? description;
  String? imageUrl;
  String? prompt;
  double? multiplier;

  StepCountModel({
    this.name,
    this.description,
    this.imageUrl,
    this.prompt,
    this.multiplier,
  });

  StepCountModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    prompt = json['prompt'];
    multiplier = json['multiplier']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['prompt'] = prompt;
    data['multiplier'] = multiplier;
    return data;
  }

  @override
  String toString() {
    return 'StepCountModel{name: $name, description: $description, imageUrl: $imageUrl, prompt: $prompt, multiplier: $multiplier}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StepCountModel &&
        other.name == name &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.prompt == prompt &&
        other.multiplier == multiplier;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        prompt.hashCode ^
        multiplier.hashCode;
  }

  static List<StepCountModel> stepCountList = [
    StepCountModel(
      name: 'Less than 3,000 steps',
      description: '',
      imageUrl: '',
      prompt: 'User takes less than 3,000 steps a day',
      multiplier: 0,
    ),
    StepCountModel(
      name: '3,000 - 5,000 steps',
      description: '',
      imageUrl: '',
      prompt: 'User takes between 3,000 and 5,000 steps a day',
      multiplier: 0.05,
    ),
    StepCountModel(
      name: '5,000 - 8,000 steps',
      description: '',
      imageUrl: '',
      prompt: 'User takes between 5,000 and 8,000 steps a day',
      multiplier: 0.075,
    ),

    StepCountModel(
      name: '8,000 - 10,000 steps',
      description: '',
      imageUrl: '',
      prompt: 'User takes between 8,000 and 10,000 steps a day',
      multiplier: 0.1,
    ),

    StepCountModel(
      name: 'more than 10,000 steps',
      description: '',
      imageUrl: '',
      prompt: 'User takes more than 10,000 steps a day',
      multiplier: 0.125,
    ),
  ];
}
