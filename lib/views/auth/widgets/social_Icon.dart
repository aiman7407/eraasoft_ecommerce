import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {

  final socialName;
  final function;

  SocialIcon({required this.socialName, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          child: Image.asset(socialName),
          radius: 25,
          backgroundColor: AppColors.kPrimarySilverColor,
        ),
      ),
    );
  }
}
