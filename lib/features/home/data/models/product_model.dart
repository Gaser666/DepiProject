class ProductModel {
  final num id;
  final String title;
  final num price;
  final String description;
  final String img;
  final RatingModel rating;

  ProductModel(
      {required this.rating,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.img});
  factory ProductModel.fromjson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      img: jsonData['image'],
      rating: RatingModel.fromjson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final num rate;
  final num count;
  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromjson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
