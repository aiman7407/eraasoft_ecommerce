import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:const  Align(
          alignment: Alignment.bottomRight,
          child:   Text('About Us',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),

      body: Padding(
        padding:const  EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
        ),
        child: Material(
          elevation:30,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(100)
          ) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppImages.aboutUsImage.assetName,
              width: double.infinity,
              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                 children: const [
                     Align(
                      alignment: Alignment.bottomLeft,
                      child:  Text('About Eraasoft',

                      style: TextStyle(
                        fontSize: 25,
                       color: AppColors.kPrimaryColor
                      ),
                      ),
                    ),
                     Text('Eraasoft bio will be here',
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize:18
                    ),
                    ),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
