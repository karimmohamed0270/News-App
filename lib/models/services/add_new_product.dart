import 'package:strore_app/helper/API.dart';
import 'package:strore_app/models/product.dart';

class AddNewProduct {
  Future<ProductModel> AddNewProductService(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await API().post(url: 'https://fakestoreapi.com/products', body: {
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
