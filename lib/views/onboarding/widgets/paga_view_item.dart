import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? img;

  PageViewItem(
      {required this.title, required this.subTitle, required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        VerticalSpace(value: 18),

        Container(
            height: SizeConfig.defaultSize!*20,
            child: Image.asset(img!)),
        VerticalSpace(value: 2.5),
        Text(
          title!,

          style: const TextStyle(
              fontSize: 30,

              color: Color(0xff2f2e41),
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),

        VerticalSpace(value: 2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            subTitle!,

            style: const TextStyle(
              fontSize: 24,
              color: Color(0xff78787c),
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
