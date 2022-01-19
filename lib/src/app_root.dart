import 'package:eraasoft_ecommerce/blocs/login/login_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/register/register_cubit.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../views/onboarding/splash_view.dart';


//TODO: implement Content of order and wish list and contact us My orders ,
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // logo
    AppConstants.logoImage = const AssetImage('assets/images/logo.png');
    precacheImage(AppConstants.logoImage, context);
// on boarding
    AppConstants.onboardingImage1 =
        const AssetImage('assets/images/onboarding1.png');
    precacheImage(AppConstants.onboardingImage1, context);

    AppConstants.onboardingImage2 =
        const AssetImage('assets/images/onboarding2.png');
    precacheImage(AppConstants.onboardingImage2, context);

    AppConstants.onboardingImage3 =
        const AssetImage('assets/images/onboarding3.png');
    precacheImage(AppConstants.onboardingImage3, context);

    // twitter images
    AppConstants.twitterImage =
    const AssetImage('assets/images/twitter.png');
    precacheImage(AppConstants.twitterImage, context);


    AppConstants.facebookImage =
    const AssetImage('assets/images/facebook.png');
    precacheImage(AppConstants.facebookImage, context);


    AppConstants.googleImage=
    const AssetImage('assets/images/google.png');
    precacheImage(AppConstants.googleImage, context);


    AppConstants.aboutUsImage=
    const AssetImage('assets/images/about_us.png');
    precacheImage(AppConstants.aboutUsImage, context);


    AppConstants.emptyCart=
    const AssetImage('assets/images/empty_cart.png');
    precacheImage(AppConstants.emptyCart, context);



    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> RegisterCubit()),
        BlocProvider(create: (context)=> LoginCubit()),
        BlocProvider(create: (context)=> ProductCubit()),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
        appBarTheme:const  AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black
          )
        )
        ),
        home: SplashView(),
      ),
    );
  }
}
