import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';
class OrderDetailsCard extends StatelessWidget {

  final lable;
  final value;


  OrderDetailsCard({ required this.value,required this.lable});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(

        elevation: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: SizeConfig.defaultSize!*10,
          width: double.infinity,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(lable,
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
              Text(value,
                style: const TextStyle(
                    fontSize: 16
                ),
              )
            ],
          )
          ,
        ),
      ),
    );
  }
}
