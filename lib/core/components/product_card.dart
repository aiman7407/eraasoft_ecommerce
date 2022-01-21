import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraasoft_ecommerce/blocs/favorite/favorite_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/favorite/favorite_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/toast/toast.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/enums/toast_state.dart';
import 'package:eraasoft_ecommerce/models/product.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:eraasoft_ecommerce/views/single_product/single_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';


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

        var productCubit = ProductCubit.get(context);
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Card(
              child: Container(
                width: SizeConfig.defaultSize! * 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        customNavigator(context: context,
                            screen: SingleProductView(product: product,),
                            finish: true);
                      },
                      child: CachedNetworkImage(imageUrl: product.image,
                        height: SizeConfig.defaultSize! * 9.5,
                      fit: BoxFit.cover,
                      placeholder: (context,url)=>Image.asset(AppImages.loadingGigs.assetName),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(product.name,
                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                          ),
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
            ),
            BlocConsumer<FavoriteCubit, FavoriteState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var favoriteCubit=FavoriteCubit.get(context);
                return IconButton(
                  icon:const  Icon(
                    Icons.favorite_border,
                    color: AppColors.kPrimaryRedColor,
                  ),
                  onPressed: () {
                    ToastConfig.showToast(msg: 'Added to WishList', toastStates: ToastStates.Success);
                    favoriteCubit.addToFavorite(product);
                  },);
              },
            ),
          ],
        );
      },
    );
  }
}
