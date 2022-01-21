import 'package:eraasoft_ecommerce/enums/order_state_enum.dart';
import 'package:eraasoft_ecommerce/models/order.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class MyOrdersCard extends StatelessWidget {
  final Order order;


  MyOrdersCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconGenerator(order.state),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(order.state.name,
                style: TextStyle(
                  fontSize: 20
                ),
                ),
                Row(
                  children: [
                    Icon(Icons.timelapse,size: 12,),
                    Text(order.date,
                      style: TextStyle(
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
                Text(order.address,
                style: TextStyle(
                  fontSize: 12
                ),
                )
              ],
            ),
            Text(order.total.toString()+' EGP',
              style: const TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        )
    );
  }


  Icon iconGenerator(OrderStateEnum orderStateEnum)
  {
    if(orderStateEnum==OrderStateEnum.Canceled) {
      return const Icon(Icons.remove_circle_outline_sharp,
      color: AppColors.kPrimaryRedColor,
        size: 30,
      );
    } else if(orderStateEnum==OrderStateEnum.OnTheWay) {
      return const  Icon(Icons.directions_subway,
      size: 30,
      );
    } else{
      return Icon(Icons.done,
      color: Colors.green,
        size: 30,
      );
    }
  }
}
