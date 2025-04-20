class SpendingModel {
  String? label;
  double? min;
  double? max;
  String? imageUrl;
  String? prompt;

  SpendingModel({this.label, this.min, this.max, this.imageUrl, this.prompt});

  SpendingModel.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    min = json['min']?.toDouble();
    max = json['max']?.toDouble();
    imageUrl = json['imageUrl'];
    prompt = json['prompt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['min'] = min;
    data['max'] = max;
    data['imageUrl'] = imageUrl;
    data['prompt'] = prompt;
    return data;
  }

  @override
  String toString() {
    return 'SpendingModel{label: $label, min: $min, max: $max, imageUrl: $imageUrl, prompt: $prompt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpendingModel &&
        other.label == label &&
        other.min == min &&
        other.max == max &&
        other.imageUrl == imageUrl &&
        other.prompt == prompt;
  }

  @override
  int get hashCode {
    return label.hashCode ^
        min.hashCode ^
        max.hashCode ^
        imageUrl.hashCode ^
        prompt.hashCode;
  }

  static List<SpendingModel> spendingRange = [
    SpendingModel(
      label: "Low Budget (₹1,000 – ₹3,000)",
      min: 1000,
      max: 3000,
      prompt:
          "I prefers a low budget for my diet plan that ranges from ₹1,000 to ₹3,000.",
    ),
    SpendingModel(
      label: "Moderate Budget (₹3,000 – ₹6,000)",
      min: 3000,
      max: 6000,
      prompt:
          "I prefers a moderate budget for my diet plan that ranges from ₹3,000 to ₹6,000.",
    ),
    SpendingModel(
      label: "Flexible Budget (₹6,000 – ₹10,000)",
      min: 6000,
      max: 10000,
      prompt:
          "I prefers a flexible budget for my diet plan that ranges from ₹6,000 to ₹10,000.",
    ),
    SpendingModel(
      label: "High Budget (₹10,000+)",
      min: 10000,
      max: 50000,
      prompt:
          "I prefers a high budget for my diet plan that starts from ₹10,000.",
    ),
  ];
}
