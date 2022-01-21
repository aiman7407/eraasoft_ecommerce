import 'package:eraasoft_ecommerce/core/components/product_card.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:flutter/material.dart';

class AllProductsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.klightSilver,
      height: SizeConfig.defaultSize!*73,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: DummyData.bestSeller.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return ProductCard(
               product: DummyData.bestSeller[index],
              );
            }),
      ),
    );
  }
}
