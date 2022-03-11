import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  AppBar().preferredSize.height*0.8,
      child: TextFormField(
        cursorColor: AppColors.kPrimaryColor,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: const InputDecoration(
          suffixIconColor: AppColors.kPrimaryColor,
          focusColor: AppColors.kPrimaryColor,
          hoverColor: AppColors.kPrimaryColor,
          hintText: 'Search',

          border: OutlineInputBorder(
            borderSide:  BorderSide(color: AppColors.kPrimaryRedColor, width: 2.0,

            ),
          ),
          suffixIcon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
