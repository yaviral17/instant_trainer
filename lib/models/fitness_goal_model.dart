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
}
