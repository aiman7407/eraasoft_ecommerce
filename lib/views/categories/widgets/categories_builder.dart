import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:eraasoft_ecommerce/views/categories/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
          itemCount: DummyData.categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
        return CategoryCard(text: DummyData.categories[index].name,
        image: DummyData.categories[index].image,
        );
          }),
    );
  }
}
