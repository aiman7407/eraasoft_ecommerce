import 'package:eraasoft_ecommerce/blocs/order/order_cubit.dart';
import 'package:eraasoft_ecommerce/core/utils/time_config.dart';
import 'package:eraasoft_ecommerce/enums/order_state_enum.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
import 'package:eraasoft_ecommerce/src/app_root.dart';
import 'package:eraasoft_ecommerce/views/auth/registeration_view.dart';
import 'package:eraasoft_ecommerce/views/home/home_view.dart';
import 'package:eraasoft_ecommerce/views/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

import 'services/cache_helper/cache_helper.dart';
import 'services/dio_helper/dio_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();


String ?token;
  bool? onBoardingState= CacheHelper.getData(key: CacheKey.ONBOARDINGSTATE);
  token = CacheHelper.getData(key: CacheKey.TOKEN);
  Widget startWidget;

  if (onBoardingState != null) {
    if (token != null) {
      startWidget = HomeView();
    } else {
      startWidget = RegistrationView();
    }
  } else {
    startWidget = OnBoardingView();
  }

  print(onBoardingState);
  print(token);

  runApp( AppRoot(
    startWidget: startWidget,
  ));



}
