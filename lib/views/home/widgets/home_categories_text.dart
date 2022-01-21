import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCategoriesText extends StatelessWidget {
 final String text;


 HomeCategoriesText({ required this.text});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(left: 8.0,top: 8,right: 4),
      child: Text(text,
        style:const  TextStyle(
            fontSize: 22,
            color: AppColors.kPrimaryColor,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
