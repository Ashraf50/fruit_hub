class FruitModel {
  final String name;
  final String image;
  final int price;
  final String description;

  FruitModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
    );
  }
}
