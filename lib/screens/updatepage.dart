import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:strore_app/models/product.dart';
import 'package:strore_app/models/services/update_product.dart';
import 'package:strore_app/widgets/custom_btn.dart';
import 'package:strore_app/widgets/text_field.dart';

class Updatepage extends StatefulWidget {
  Updatepage({super.key});
  static const String id = 'updatepage';

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  bool isLoading = false;

  String? productname;

  String? image;

  double? price;

  String? category;

  String? description;

  @override
  Widget build(BuildContext context) {
    //  i save the old data that i send from homepage to use it in the update product service
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Center(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Update Product'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    texthint: 'Product Name',
                    onchange: (data) {
                      productname = data;
                    },
                  ),
                  CustomTextField(
                    texthint: 'image',
                    onchange: (data) {
                      image = data;
                    },
                  ),
                  CustomTextField(
                    texthint: 'price',
                    keyboardType: TextInputType.number,
                    onchange: (data) {
                      price = double.tryParse(data);
                    },
                  ),
                  CustomTextField(
                    texthint: 'Categoery',
                    onchange: (data) {
                      category = data;
                    },
                  ),
                  CustomTextField(
                    texthint: 'Desscribtion',
                    onchange: (data) {
                      description = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      text: "Update",
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          await UpdateProduct().updateProductService(
                            // if the update value null return the old data
                            title: productname == null
                                ? product.title
                                : productname!,
                            price: price == null ? product.price : price!,
                            description: description == null
                                ? product.description
                                : description!,
                            image: image == null ? product.image : image!,
                            // i take the category from the update product page as argument
                            category: product.category,
                            id: product.id,
                          );

                          setState(() {
                            isLoading = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Product updated successfully'),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Update failed: ${e.toString()}'),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 4),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
