import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
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
              child: CachedNetworkImage(imageUrl: image,
                height: SizeConfig.defaultSize! * 9.5,
                fit: BoxFit.cover,
                placeholder: (context,url)=>Image.asset(AppImages.loadingGigs.assetName),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
