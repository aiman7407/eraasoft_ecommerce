import 'package:eraasoft_ecommerce/models/old_product.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';


class SingleProductView extends StatelessWidget {
final OldProduct product;


SingleProductView({required this.product});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(20),
                topRight: Radius.circular(20),
                )
              ),
              child: Image.network(product.image),

            ),
            Text(product.name),
            Text(product.price.toString()),

            const Text('WAIT FOR REST OF DATA',
            style: TextStyle(
              fontSize: 30,
              color: AppColors.kPrimaryRedColor
            ),
            )

          ],
        ),
      ) ,
    );
  }
}
