import 'dart:convert';
import 'package:strore_app/helper/API.dart';
import 'package:strore_app/models/product.dart';


class GetAllProdyctbycategryService {
  Future<List<ProductModel>> getAllProdyctbycategry(
      {required String categoryName}) async {
    // var response = await http.get(
    //     Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));

    //  from api heloper
    var response = await API()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List products = jsonDecode(response.body);

    List<ProductModel> allproducts = [];

    for (var i = 0; i < products.length; i++) {
      allproducts.add(ProductModel.fromJson(products[i]));
    }

    return allproducts;
  }
}
