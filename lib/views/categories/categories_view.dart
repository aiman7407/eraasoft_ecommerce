import 'package:eraasoft_ecommerce/views/categories/widgets/categories_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/categories_home_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/home_categories_text.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('Categories',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeCategoriesText(text: 'All Categories',),
            CategoriesBuilder()
          ],
        ),
      ),
    );
  }
}
