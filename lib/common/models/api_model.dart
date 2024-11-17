class ApiModel {
  String? name;
  String? code;
  String? price;
  double? percentage;
  String? movement;
  String? image;

  ApiModel(
      {this.name,
      this.code,
      this.price,
      this.percentage,
      this.movement,
      this.image});

  ApiModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? ''; // Default to an empty string if null
    code = json['code'] ?? '';
    price = json['price'] ?? '';
    percentage = json['percentage'] != null
        ? (json['percentage'] is int
            ? (json['percentage'] as int).toDouble()
            : json['percentage'] as double)
        : 0.0; // Default to 0.0 if null
    movement = json['movement'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['price'] = this.price;
    data['percentage'] = this.percentage;
    data['movement'] = this.movement;
    data['image'] = this.image;
    return data;
  }
}
