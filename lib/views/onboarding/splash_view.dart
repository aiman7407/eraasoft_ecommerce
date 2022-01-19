import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding.dart';

class SplashView extends StatefulWidget {
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
    SizeConfig.init(context);
    return Scaffold(
      body: Center(child: Image.asset(AppConstants.logoImage.assetName)),
    );
  }

  void goToNextView(context) {
    Future.delayed(const Duration(seconds: 3), () {
      // customNavigator(context: context,screen:OnBoardingView() ,finish:true );
      Get.to(
        () => OnBoardingView(),

        duration: const Duration(seconds: 3),
        transition: Transition.fade,
      );
    });
  }
}
