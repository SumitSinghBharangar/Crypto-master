class ApiModel {
  String? name;
  String? price;
  double? percentage;
  String? movement;

  ApiModel({
    this.name,
    this.price,
    this.percentage,
    this.movement,
  });

  ApiModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    // Safely handle the 'percentage' field
    percentage = json['percentage'] != null
        ? (json['percentage'] is int
            ? (json['percentage'] as int).toDouble()
            : json['percentage'] as double)
        : null;
    movement = json['movement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['price'] = this.price;
    data['percentage'] = this.percentage;
    data['movement'] = this.movement;
    return data;
  }
}
