import 'dart:convert';
import 'package:strore_app/helper/API.dart';

class AllCategeriosService {
  Future<List<dynamic>> getAllCategory() async {
    // var response = await http
    //     .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    //  from api heloper
    var response =
        await API().get(url: 'https://fakestoreapi.com/products/categories');

    List category = jsonDecode(response.body);
    return category;
  }
}
