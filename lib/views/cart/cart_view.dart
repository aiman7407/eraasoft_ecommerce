import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraasoft_ecommerce/blocs/order/order_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/user/user_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/toast/toast.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/core/utils/time_config.dart';
import 'package:eraasoft_ecommerce/enums/order_state_enum.dart';
import 'package:eraasoft_ecommerce/enums/toast_state_enum.dart';
import 'package:eraasoft_ecommerce/models/order.dart';
import 'package:eraasoft_ecommerce/models/auth.dart';
import 'package:eraasoft_ecommerce/models/user.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/views/order_details/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'Cart',
          ),
        ),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var productCubit = ProductCubit.get(context);

          return BuildCondition(
            condition: productCubit.newCart.isNotEmpty,
            fallback: (context) =>
                Center(child: Image.asset(AppImages.emptyCart.assetName)),
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: productCubit.newCart.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    width: double.infinity,
                                    height: SizeConfig.defaultSize! * 10,
                                    child: Row(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: productCubit.newCart[index].image.toString(),
                                          fit: BoxFit.cover,
                                          placeholder: (context,url)=>Image.asset(AppImages.loadingGigs.assetName),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                        ),
                                        Column(
                                          children: [
                                            Text(productCubit.newCart[index].name.toString(),
                                              style: TextStyle(
                                                  fontSize: 17
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  productCubit.removeFromCartNew(index);
                                  ToastConfig.showToast(msg: 'Product Has been removed Successfully from your cart',
                                      toastStates: ToastStates.Success);
                                },
                                child: const Icon(Icons.highlight_remove,
                                    color: AppColors.kPrimaryRedColor,
                                    size: 35
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: SizeConfig.defaultSize! * 5,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: AppColors.klightSilver,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child:  Text('Price',
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(productCubit.getNewTotal().toString() + ' EGP',
                            style: const TextStyle(
                                fontSize: 20,
                                color: AppColors.kPrimaryColor
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<OrderCubit, OrderState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = OrderCubit.get(context);
                      var user= UserCubit.get(context).userHub;
                      return GeneralButton(btnText: 'Cheakout', function: ()
                      {
                        cubit.addOrder(
                            Order(
                              total: productCubit.newTotal,
                            state: OrderStateEnum.OnTheWay,
                            date: TimeConfig.getCurrentTime(),
                            user: user!.data!.profile,
                        ));
                        productCubit.cart.clear();
                       AppNavigator.customNavigator(context: context,
                           screen: OrderDetailsView(), finish: false);
                      });
                    },
                  )
                ],
              );
            },

          );
        },
      ),
    );
  }
}
