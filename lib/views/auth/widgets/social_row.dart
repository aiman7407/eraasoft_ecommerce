import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/views/auth/widgets/social_Icon.dart';
import 'package:flutter/material.dart';

class SocialRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          socialName: AppImages.facebookImage.assetName,
          function: (){
            print('facebook Done');
          },
        ),
        SocialIcon(
          socialName: AppImages.twitterImage.assetName,
          function: (){
            print('twotter Done');
          },
        ),
        SocialIcon(
          socialName: AppImages.googleImage.assetName,
          function: (){
            print('google Done');
          },
        ),
      ],
    );
  }
}
