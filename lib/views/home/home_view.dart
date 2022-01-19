import 'package:carousel_slider/carousel_slider.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/all_products_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/banner_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/best_seller_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/categories_home_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/drawer_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/home_categories_text.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: add search
        title: const Text('TEST'),
      ),
      drawer:  DrawerBuilder(),
      body: SingleChildScrollView(
        physics: const  BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerBuilder(
              images: DummyData.banners,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpace(value: 2),
                  HomeCategoriesText(text: 'Categories'),
                  CategoriesHomeBuilder(),
                  VerticalSpace(value: 2),
                  HomeCategoriesText(text: 'Best Seller'),
                  VerticalSpace(value: 1),
                  BestSellerBuilder(),
                  HomeCategoriesText(text: 'All Productts'),
                  //all products
                  AllProductsBuilder()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
