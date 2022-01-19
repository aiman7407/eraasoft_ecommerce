import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final bool isRegister;

  AuthHeader({this.isRegister = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppConstants.logoImage.assetName,
          width: double.infinity,
        ),
         Text(
          isRegister?
          'Welcome to Portatile':'Welcome Back',
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.kPrimaryColor, fontSize: 30),
        ),
        const VerticalSpace(
          value: 1,
        ),
         Text(
    isRegister?
    'Please sign up to join us ':'Please login to your account ',
          style:const  TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
