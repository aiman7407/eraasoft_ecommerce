import 'package:eraasoft_ecommerce/models/order.dart';
import 'package:eraasoft_ecommerce/views/my_order/widgets/my_orders_card.dart';
import 'package:flutter/material.dart';


class MyOrderBuilder extends StatelessWidget {
final List<Order> myOrders;

MyOrderBuilder({required this.myOrders});

@override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics:const BouncingScrollPhysics(),
          itemCount: myOrders.length,
          itemBuilder: (context, index) {
        return Column(
          children: [
            MyOrdersCard(order: myOrders[index]),
            Divider(height: 20,
            thickness: 2,)
          ],
        );
      }),
    );
  }
}
