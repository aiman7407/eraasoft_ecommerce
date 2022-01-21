import 'package:eraasoft_ecommerce/blocs/favorite/favorite_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/login/login_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/order/order_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/blocs/register/register_cubit.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../views/onboarding/splash_view.dart';


//TODO: implement Content of order and wish list and contact us My orders ,
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // logo
    AppImages.logoImage = const AssetImage('assets/images/logo.png');
    precacheImage(AppImages.logoImage, context);
// on boarding
    AppImages.onboardingImage1 =
        const AssetImage('assets/images/onboarding1.png');
    precacheImage(AppImages.onboardingImage1, context);

    AppImages.onboardingImage2 =
        const AssetImage('assets/images/onboarding2.png');
    precacheImage(AppImages.onboardingImage2, context);

    AppImages.onboardingImage3 =
        const AssetImage('assets/images/onboarding3.png');
    precacheImage(AppImages.onboardingImage3, context);

    // twitter images
    AppImages.twitterImage =
    const AssetImage('assets/images/twitter.png');
    precacheImage(AppImages.twitterImage, context);


    AppImages.facebookImage =
    const AssetImage('assets/images/facebook.png');
    precacheImage(AppImages.facebookImage, context);


    AppImages.googleImage=
    const AssetImage('assets/images/google.png');
    precacheImage(AppImages.googleImage, context);


    AppImages.aboutUsImage=
    const AssetImage('assets/images/about_us.png');
    precacheImage(AppImages.aboutUsImage, context);


    AppImages.emptyCart=
    const AssetImage('assets/images/empty_cart.png');
    precacheImage(AppImages.emptyCart, context);


    AppImages.mapsImage=
    const AssetImage('assets/images/maps.png');
    precacheImage(AppImages.mapsImage, context);


    AppImages.emptyWishlist=
    const AssetImage('assets/images/empty_wishlist.png');
    precacheImage(AppImages.emptyWishlist, context);


    AppImages.loadingGigs=
    const AssetImage('assets/gifs/loading.gif');
    precacheImage(AppImages.loadingGigs, context);

    AppImages.bestsellerGifs=
    const AssetImage('assets/gifs/bestsellar.gif');
    precacheImage(AppImages.bestsellerGifs, context);


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> RegisterCubit()),
        BlocProvider(create: (context)=> LoginCubit()),
        BlocProvider(create: (context)=> ProductCubit()),
        BlocProvider(create: (context)=> OrderCubit()),
        BlocProvider(create: (context)=> FavoriteCubit()),
      ],
      child: MaterialApp(
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
