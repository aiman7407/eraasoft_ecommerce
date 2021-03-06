import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/components/old_product_card.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BestSellerBuilder extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.klightSilver,
      height: SizeConfig.defaultSize!*21,
      child: ListView.builder(
          physics:const  BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal ,
          itemCount: DummyData.bestSeller.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(6),
              child: OldProductCard(
                 product:  DummyData.bestSeller[index]
              ),
            );
          }),
    );
  }
}


