class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: (json['price'] as num).toDouble(),
        category: json['category'],
        image: json['image'],
        //  to give the 2 value at the same time for rating (rate and count)
        rating: RatingModel.fromJson(json['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
