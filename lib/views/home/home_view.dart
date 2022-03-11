import 'package:eraasoft_ecommerce/blocs/category/category_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/user/user_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/all_products_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/banner_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/best_seller_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/categories_home_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/drawer_builder.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/home_categories_text.dart';
import 'package:eraasoft_ecommerce/views/home/widgets/search_bar.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    //TODO: TRY TO FIX IT
    CategoryCubit.get(context).getCategories();
    UserCubit.get(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: Modify Search
        title: SearchBar(),
      ),
      drawer: DrawerBuilder(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerBuilder(
              images: DummyData.banners,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(value: 2),
                  HomeCategoriesText(text: 'Categories'),
                  CategoriesHomeBuilder(),
                  const VerticalSpace(value: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HomeCategoriesText(text: 'Best Seller'),
                      // Expanded(
                      //   child: Image.asset(AppImages.bestsellerGifs.assetName,
                      //
                      //   ),
                      // ),
                    ],
                  ),
                  const VerticalSpace(value: 1),
                  BestSellerBuilder(),
                  HomeCategoriesText(text: 'All Products'),
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
