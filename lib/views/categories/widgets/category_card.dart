import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final image ;
  final text;


  CategoryCard({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Container(
        height:SizeConfig.defaultSize!*20 ,
        width: SizeConfig.screenWidth!*20,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Image.network(image,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(text,
              style: TextStyle(
                fontSize: 20
              ),
              ),
            )
          ],
        ) ,
      ),
    );
  }
}
