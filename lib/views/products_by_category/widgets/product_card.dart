import 'package:eraasoft_ecommerce/models/product.dart';
import 'package:flutter/material.dart';


class ProductCardByCategory extends StatelessWidget {
  final Product   product;
  ProductCardByCategory({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(product.name.toString()),
          Text(product.price.toString())

        ],
      ),
    );
  }
}
