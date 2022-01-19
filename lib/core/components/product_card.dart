import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/models/product.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:eraasoft_ecommerce/views/single_product/single_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductCard extends StatelessWidget {

  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=ProductCubit.get(context);
        return Card(
          child: Container(
            width: SizeConfig.defaultSize! * 20,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    customNavigator(context: context,
                        screen: SingleProductView(product: product,),
                        finish: true);
                  },
                  child: Image.network(product.image,
                    height: SizeConfig.defaultSize! * 9.5,
                  ),
                ),
                Text(product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                ),
                Text('${product.price.toString()} EGP',
                  style: const TextStyle(color: AppColors.kPrimaryRedColor),
                ),
                GestureDetector(
                  onTap: () {
                    //ToDo: add to cart animation
                    //TODO: add to cart Toast
                    cubit.addToCart(product);
                  },
                  child: Container(
                    height: 30,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(3)),
                    child: const Center(
                      child: Text(
                        'Add To cart',
                        style: TextStyle(fontSize: 15, color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
