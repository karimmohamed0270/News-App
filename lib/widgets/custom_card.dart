import 'package:flutter/material.dart';
import 'package:strore_app/models/product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.products,
  });

  ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // card for product
        Container(
          height: 130,
          width: 210,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.title.substring(0, 12),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        products.price.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Icon(Icons.favorite, color: Colors.grey),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          right: 35,
          child: Image.network(
            products.image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
