import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strore_app/models/product.dart';
import 'package:strore_app/models/services/get_all_products.dart';
import 'package:strore_app/screens/updatepage.dart';
import 'package:strore_app/widgets/custom_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static const String id = 'homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
          title: const Text(
            'Store App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 65.0, left: 10),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductsService().getallproducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> Productslist = snapshot.data!;
                  return GridView.builder(
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                      ),
                      // 2
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // **************************************************************
                            //  send the old data also to the update page to use it if i want
                            Navigator.pushNamed(context, Updatepage.id,
                                arguments: Productslist[index]);
                          },
                          child: CustomCard(
                            products: Productslist[index],
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
