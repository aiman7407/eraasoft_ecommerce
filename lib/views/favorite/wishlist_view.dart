import 'package:buildcondition/buildcondition.dart';
import 'package:eraasoft_ecommerce/blocs/favorite/favorite_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/favorite/favorite_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/old_product_card.dart';
import 'package:eraasoft_ecommerce/core/components/product_card.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/views/favorite/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Align(

            alignment: Alignment.topRight,
            child:  Text('WishList')),
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=FavoriteCubit.get(context);
          return BuildCondition(
            condition:cubit.favoriteProducts.isNotEmpty ,
            fallback:(context)=>Center(child: Image.asset(AppImages.emptyWishlist.assetName)) ,
            builder:(context)=>Column(
              children: [
               Expanded(
                 child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                     physics: const BouncingScrollPhysics(),
                     itemCount: cubit.favoriteProducts.length,
                     itemBuilder: (context,index){
                   return ProductCard(product: cubit.favoriteProducts[index]);
                     }),
               )
              ],
            ) ,
          );
        },
      ),
    );
  }
}
