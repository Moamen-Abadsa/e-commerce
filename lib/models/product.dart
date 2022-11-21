class Product {
  late final String id;
  late final String category;
  late final String name;
  late final double price;
  late final double originalPrice;
  late final bool isFavourite;
  late final String image;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.isFavourite,
    required this.image
  });
}
