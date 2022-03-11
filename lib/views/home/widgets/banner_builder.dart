import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:flutter/material.dart';

class BannerBuilder extends StatelessWidget {
  final images;


  BannerBuilder({this.images});

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
        items: images
            .map<Widget>((e) =>
          //   Image(
          // image: NetworkImage(e),
          // width: double.infinity,
          // height: SizeConfig.defaultSize!*17,
          // fit: BoxFit.fill,),

        CachedNetworkImage(imageUrl: e,
          width: double.infinity,
          height: SizeConfig.defaultSize!*17,
          fit: BoxFit.cover,
          placeholder: (context,url)=> LinearProgressIndicator(
            color: AppColors.kPrimaryColor,
          ),
              //Image.asset(AppImages.loadingGigs.assetName),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
        )
            .toList(),
        options: CarouselOptions(
            height: SizeConfig.defaultSize!*17,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            scrollDirection: Axis.horizontal,
            viewportFraction: 1.0));
  }
}
