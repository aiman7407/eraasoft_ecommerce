import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_helper.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/views/auth/registeration_view.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_indicator.dart';
import 'widgets/page_view.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPageView(pageController: pageController),
          Positioned(
              bottom: SizeConfig.defaultSize! * 20,
              right: 0,
              left: 0,
              child: CustomIndicator(
                dotsIndex:
                    pageController!.hasClients ? pageController?.page : 0,
              )),
          Visibility(
            visible: pageController!.hasClients
                ? (pageController?.page == 2 ? false : true)
                : true,
            child: Positioned(
              child: GestureDetector(
                onTap: (){
                  onSubmit();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.kPrimaryRedColor
                  ),
                  child: const Text('Skip',
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                  ),
                  ),
                ),
              ),
              top: SizeConfig.defaultSize! * 10,
              right: 32,
            ),
          ),

      pageController!.hasClients
          ? pageController?.page == 2 ?

          Positioned(
            child: GeneralButton(
                btnText:'Get Started',
            function: (){
              onSubmit();
            },
            ),
            right: SizeConfig.defaultSize! * 2,
            left: SizeConfig.defaultSize! * 2,
            bottom: SizeConfig.defaultSize! * 13,
          ) : Container() : Container()
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  onSubmit(){
    CacheHelper.saveData(key: CacheKey.ONBOARDINGSTATE, value: true).then((value) {
      if(value) {
        AppNavigator.customNavigator(context: context, screen: RegistrationView(), finish: true);
      }
    });

  }
}
