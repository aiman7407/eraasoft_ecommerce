import 'package:eraasoft_ecommerce/core/utils/time_config.dart';
import 'package:eraasoft_ecommerce/src/app_root.dart';
import 'package:flutter/material.dart';

import 'services/cache_helper/cache_helper.dart';
import 'services/dio_helper/dio_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const AppRoot());



}
