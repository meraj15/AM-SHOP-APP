class ProductData {
  final String title;
  final String description;
  final num price;
  final String image;
  final int count;
  final num rate;
  final String category;
  String selectedSize = "L";
  int selectedquantity = 1;
  bool isInCart;
  List<ProductData> cardProduct = [];

  ProductData({
    required this.description,
    required this.price,
    required this.image,
    required this.title,
    required this.count,
    required this.rate,
    required this.category,
    this.isInCart = false,
  });

  factory ProductData.fromMap(Map map) {
    return ProductData(
        description: map["description"],
        price: map["price"],
        image: map["image"],
        title: map["title"],
        count: map["rating"]["count"],
        rate: map["rating"]["rate"],
        category: map["category"]);
  }

  
}
