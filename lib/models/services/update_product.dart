import 'package:strore_app/helper/API.dart';
import 'package:strore_app/models/product.dart';

class UpdateProduct {
  Future<ProductModel> updateProductService({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
    required int id,
  }) async {
    Map<String, dynamic> data =
        await API().put(url: 'https://fakestoreapi.com/products/:$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    //  i store the data that i send in map called data  and then convert that map to product model

    return ProductModel.fromJson(data);
  }
}
