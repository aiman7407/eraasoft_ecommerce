import 'package:dots_indicator/dots_indicator.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';

import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {

  final double ?dotsIndex;

  CustomIndicator({required this.dotsIndex});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
        color: Colors.transparent,
        activeColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.kPrimaryColor)),

      ) ,
      dotsCount: 3,
      position: dotsIndex!,
    );
  }
}
