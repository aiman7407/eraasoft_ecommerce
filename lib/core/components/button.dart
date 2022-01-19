import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String btnText;
  final  function;

  GeneralButton({required this.btnText,required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:function ,
      child: Container(
        height: 50,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: AppColors.kPrimaryColor, borderRadius: BorderRadius.circular(3)),
        child: Center(
          child: Text(
            btnText,
            style: const TextStyle(fontSize: 20, color: Colors.white,
            fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
