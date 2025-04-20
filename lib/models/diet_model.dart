class DietModel {
  String? name;
  String? description;
  String? imageUrl;

  DietModel({this.name, this.description, this.imageUrl});

  DietModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }

  @override
  String toString() {
    return 'DietModel{name: $name, description: $description, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DietModel &&
        other.name == name &&
        other.description == description &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^ description.hashCode ^ imageUrl.hashCode;
  }
}
