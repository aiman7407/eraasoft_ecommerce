import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCategoriesText extends StatelessWidget {
 final String text;


 HomeCategoriesText({ required this.text});

  @override
  Widget build(BuildContext context) {
    return   Text(text,
      style:const  TextStyle(
          fontSize: 22,
          color: AppColors.kPrimaryColor
      ),
    );
  }
}
