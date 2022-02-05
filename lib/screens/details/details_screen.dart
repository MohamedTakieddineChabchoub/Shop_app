import 'package:flutter/material.dart';

import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/body.dart';

import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final ProductsDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductsDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(arguments.product.rating),
      body: Body(
        product: arguments.product,
      ),
    );
  }
}

class ProductsDetailsArguments {
  final Product product;

  ProductsDetailsArguments({required this.product});
}
