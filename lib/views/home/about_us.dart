import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Align(
          alignment: Alignment.bottomRight,
          child: const  Text('About Us',
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
              Image.asset(AppConstants.aboutUsImage.assetName,
              width: double.infinity,
              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: Column(
                 children: [
                   const  Align(
                      alignment: Alignment.bottomLeft,
                      child: const Text('we are portatile company',

                      style: TextStyle(
                        fontSize: 25,
                       color: AppColors.kPrimaryColor
                      ),
                      ),
                    ),
                    const Text('Early computers were meant to be used only for calculations. Simple manual instruments like the abacus have aided people in doing calculations since ancient times. Early in the Industrial Revolution, some mechanical devices were built to automate long tedious tasks, such as guiding patterns for looms. More sophisticated electrical machines did specialized analog calculations in the early 20th century. The first digital electronic calculating machines were developed during World War II. The first semiconductor transistors in the late 1940s were followed by the silicon-based MOSFET (MOS transistor) and monolithic integrated circuit (IC) chip technologies in the late 1950s',
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
