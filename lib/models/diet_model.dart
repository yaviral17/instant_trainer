class DietModel {
  String? name;
  String? description;
  String? imageUrl;
  String? prompt;

  DietModel({this.name, this.description, this.imageUrl, this.prompt});

  DietModel.fromJson(Map<String, dynamic> json) {
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
    return 'DietModel{name: $name, description: $description, imageUrl: $imageUrl, prompt: $prompt}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DietModel &&
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

  static List<DietModel> dietList = [
    DietModel(
      name: "Basic",
      description:
          "Includes all food groups. Suitable for people with no dietary restrictions.",
      imageUrl: "",
      prompt:
          "I prefer a basic dietary preference that includes all food groups. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Vegetarian",
      description: "Excludes meat and fish. Suitable for vegetarians.",
      imageUrl: "",
      prompt:
          "I prefer a vegetarian dietary preference that excludes meat and fish. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Vegan",
      description: "Excludes all animal products. Suitable for vegans.",
      imageUrl: "",
      prompt:
          "I prefer a vegan dietary preference that excludes all animal products. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Pescatarian",
      description:
          "Excludes meat but includes fish. Suitable for pescatarians.",
      imageUrl: "",
      prompt:
          "I prefer a pescatarian dietary preference that excludes meat but includes fish. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Flexitarian",
      description:
          "Primarily vegetarian with occasional meat or fish. Suitable for flexitarians.",
      imageUrl: "",
      prompt:
          "I prefer a flexitarian dietary preference that is primarily vegetarian with occasional meat or fish. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Keto",
      description:
          "Low in carbohydrates, high in fat. Suitable for people on a ketogenic diet.",
      imageUrl: "",
      prompt:
          "I prefer a keto dietary preference that is low in carbohydrates and high in fat. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Paleo",
      description:
          "Based on foods eaten by early humans. Excludes processed foods and grains.",
      imageUrl: "",
      prompt:
          "I prefer a paleo dietary preference that is based on foods eaten by early humans and excludes processed foods and grains. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Mediterranean",
      description:
          "Emphasizes fruits, vegetables, fish, and olive oil. Heart-healthy and balanced.",
      imageUrl: "",
      prompt:
          "I prefer a Mediterranean dietary preference that emphasizes fruits, vegetables, fish, and olive oil. I have no dietary restrictions.",
    ),
    DietModel(
      name: "DASH",
      description:
          "Designed to help lower blood pressure. Rich in fruits and vegetables.",
      imageUrl: "",
      prompt:
          "I prefer a DASH dietary preference that is designed to help lower blood pressure and is rich in fruits and vegetables. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Whole30",
      description:
          "30-day reset diet eliminating sugar, grains, dairy, and legumes.",
      imageUrl: "",
      prompt:
          "I prefer a Whole30 dietary preference that is a 30-day reset diet eliminating sugar, grains, dairy, and legumes. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Gluten-Free",
      description:
          "Excludes gluten. Suitable for people with gluten intolerance or celiac disease.",
      imageUrl: "",
      prompt:
          "I prefer a gluten-free dietary preference that excludes gluten. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-FODMAP",
      description:
          "Low in fermentable carbs. Suitable for people with IBS or digestive issues.",
      imageUrl: "",
      prompt:
          "I prefer a low-FODMAP dietary preference that is low in fermentable carbs. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Anti-Inflammatory",
      description:
          "Focuses on foods that reduce inflammation. Includes omega-3s and antioxidants.",
      imageUrl: "",
      prompt:
          "I prefer an anti-inflammatory dietary preference that focuses on foods that reduce inflammation and includes omega-3s and antioxidants. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-Sodium",
      description:
          "Limits salt intake. Suitable for people with high blood pressure.",
      imageUrl: "",
      prompt:
          "I prefer a low-sodium dietary preference that limits salt intake. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-Cholesterol",
      description:
          "Reduces intake of saturated fats and cholesterol. Heart-friendly diet.",
      imageUrl: "",
      prompt:
          "I prefer a low-cholesterol dietary preference that reduces intake of saturated fats and cholesterol. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-Sugar",
      description:
          "Limits sugar. Suitable for people with diabetes or those trying to lose weight.",
      imageUrl: "",
      prompt:
          "I prefer a low-sugar dietary preference that limits sugar. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-Carb",
      description:
          "Reduces carbohydrate intake. Supports weight loss and blood sugar control.",
      imageUrl: "",
      prompt:
          "I prefer a low-carb dietary preference that reduces carbohydrate intake. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-Fat",
      description: "Minimizes fat intake. Suitable for low-fat dietary goals.",
      imageUrl: "",
      prompt:
          "I prefer a low-fat dietary preference that minimizes fat intake. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-Calorie",
      description:
          "Reduces overall calorie consumption. Suitable for weight loss.",
      imageUrl: "",
      prompt:
          "I prefer a low-calorie dietary preference that reduces overall calorie consumption. I have no dietary restrictions.",
    ),
    DietModel(
      name: "High-Protein",
      description: "Emphasizes protein for muscle building and satiety.",
      imageUrl: "",
      prompt:
          "I prefer a high-protein dietary preference that emphasizes protein for muscle building and satiety. I have no dietary restrictions.",
    ),
    DietModel(
      name: "High-Fiber",
      description:
          "Includes high-fiber foods to support digestion and heart health.",
      imageUrl: "",
      prompt:
          "I prefer a high-fiber dietary preference that includes high-fiber foods to support digestion and heart health. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Low-Glycemic",
      description: "Maintains stable blood sugar by focusing on low-GI foods.",
      imageUrl: "",
      prompt:
          "I prefer a low-glycemic dietary preference that maintains stable blood sugar by focusing on low-GI foods. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Intermittent Fasting",
      description:
          "Focuses on meal timing (e.g., 16:8 fasting). Helps with weight and metabolism.",
      imageUrl: "",
      prompt:
          "I prefer an intermittent fasting dietary preference that focuses on meal timing (e.g., 16:8 fasting). I have no dietary restrictions.",
    ),

    // Religious/Cultural Diets
    DietModel(
      name: "Halal",
      description:
          "Follows Islamic dietary laws. Excludes pork and alcohol. Meat must be halal-certified.",
      imageUrl: "",
      prompt:
          "I prefer a halal dietary preference that follows Islamic dietary laws. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Kosher",
      description:
          "Follows Jewish dietary laws. Includes specific preparation and food combinations.",
      imageUrl: "",
      prompt:
          "I prefer a kosher dietary preference that follows Jewish dietary laws. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Satvik",
      description:
          "Vegetarian Indian diet that excludes onion, garlic, and processed food. Rooted in Ayurveda.",
      imageUrl: "",
      prompt:
          "I prefer a satvik dietary preference that is a vegetarian Indian diet excluding onion, garlic, and processed food. I have no dietary restrictions.",
    ),
    DietModel(
      name: "Jain",
      description:
          "Strict vegetarian diet excluding root vegetables and fermented foods.",
      imageUrl: "",
      prompt:
          "I prefer a Jain dietary preference that is a strict vegetarian diet excluding root vegetables and fermented foods. I have no dietary restrictions.",
    ),
  ];
}
