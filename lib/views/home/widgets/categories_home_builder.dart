import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoriesHomeBuilder extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize!*12.5,
      child: ListView.builder(
        physics:const  BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal ,
          itemCount: DummyData.categories.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: SizeConfig.defaultSize!*18,
                height: SizeConfig.defaultSize!*12.5,
                decoration: const BoxDecoration(
                  color: AppColors.klightSilver
                ),
                child: Column(
                  children: [
                    Image.network(DummyData.categories[index].image,
                      height: SizeConfig.defaultSize!*9.5,
                    ),
                    Text(DummyData.categories[index].name,
                      style:const  TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
