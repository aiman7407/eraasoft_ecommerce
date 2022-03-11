import 'package:eraasoft_ecommerce/blocs/order/order_cubit.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/views/home/home_view.dart';
import 'package:eraasoft_ecommerce/views/my_order/widgets/my_orders_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit= OrderCubit.get(context);
        return Scaffold(
          appBar: AppBar(

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.home),
                onPressed: (){
                  AppNavigator.customNavigator(context: context, screen: HomeView(), finish: true);
                },
                ),
                Text('My orders'),
              ],
            ),
          ),
          body: Column(
            children: [
              MyOrderBuilder(myOrders: cubit.myOrders,)
            ],
          ),
        );
      },
    );
  }
}
