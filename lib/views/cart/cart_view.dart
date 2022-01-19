import 'package:buildcondition/buildcondition.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.bottomRight,
          child: const Text(
            'Cart',
          ),
        ),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ProductCubit.get(context);

          return BuildCondition(
            condition: cubit.cart.isNotEmpty,
            fallback:(context)=>Center(child: Image.asset(AppConstants.emptyCart.assetName)) ,
            builder:(context){
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                       physics: const  BouncingScrollPhysics(),
                      itemCount: cubit.cart.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [

                            Card(
                              elevation: 5,
                              child: Container(
                                width: double.infinity,
                                height: SizeConfig.defaultSize!*10,
                                child: Row(
                                  children: [
                                    Image.network(cubit.cart[index].image),
                                    Column(
                                      children: [Text(cubit.cart[index].name,
                                      style: TextStyle(
                                        fontSize: 17
                                      ),
                                      )],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                cubit.removeFromCart(index);
                              },
                              child:const  Icon(Icons.remove_circle,
                                color: AppColors.kPrimaryRedColor,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: SizeConfig.defaultSize!*5,
                    alignment: Alignment.center,
                    decoration:  const BoxDecoration(
                      color: AppColors.klightSilver,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const  Text('Price',
                        style: TextStyle(
                          fontSize: 20
                        ),
                        ),

                        Text(cubit.getTotal().toString()+' EGP',
                        style:const  TextStyle(
                          fontSize: 20,
                          color: AppColors.kPrimaryColor
                        ),
                        ),
                      ],
                    ),
                  ),
                  GeneralButton(btnText: 'Cheakout', function: (){
                    //TODO: Complete CheckOut
                  })
                ],
              );
            } ,

          );
        },
      ),
    );
  }
}
