import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:flutter/material.dart';

import 'onboarding.dart';

class SplashView extends StatefulWidget {

  final startWidget;

  SplashView({this.startWidget});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    goToNextView(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// add only one time
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
          /// the usage of the package
        height: SizeConfig.defaultSize!*10,
          child: Center(child: Image.asset(AppImages.logoImage.assetName))),
    );
  }

  ///splash view
  void goToNextView(context) {
    Future.delayed(Duration(),(){});
    Future.delayed(const Duration(seconds: 3),
            () {

    });
  }
}
