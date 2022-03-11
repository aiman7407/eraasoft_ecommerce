import 'package:eraasoft_ecommerce/blocs/favorite/favorite_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/favorite/favorite_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/core/toast/toast.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/enums/toast_state_enum.dart';
import 'package:eraasoft_ecommerce/models/old_product.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:eraasoft_ecommerce/views/single_product/single_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductCardFavorite extends StatelessWidget {

  final OldProduct product;

  ProductCardFavorite({required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        var productCubit = ProductCubit.get(context);
        return Card(
          child: Container(
            width: SizeConfig.defaultSize! * 20,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AppNavigator.customNavigator(context: context,
                        screen: SingleProductView(product: product,),
                        finish: false);
                  },
                  child: Image.network(product.image,
                    height: SizeConfig.defaultSize! * 9.5,
                  ),
                ),
                Flexible(
                  child: Text(product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                  ),
                ),
                Text('${product.price.toString()} EGP',
                  style: const TextStyle(color: AppColors.kPrimaryRedColor),
                ),
                GestureDetector(
                  onTap: () {
                    //ToDo: add to cart animation
                    ToastConfig.showToast(msg: 'Added To cart',
                        toastStates: ToastStates.Success);
                    productCubit.addToCart(product);
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
