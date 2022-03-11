import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/models/category.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_helper.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
import 'package:eraasoft_ecommerce/services/dio_helper/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context)=> BlocProvider.of(context);

  CategoriesHub ?categoriesHub;
  List<Category> categories=[];
  void getCategories() {
    DioHelper.getData(
        url: 'categories',
        token:
        CacheHelper.getData(key: CacheKey.TOKEN)
    ).then((value) {
      var jsonData=jsonDecode(value.data);
      categoriesHub = CategoriesHub.fromJson(jsonData);
      for(var category in categoriesHub!.data!)
      {
        categories.add(category);
      }
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState());
    });
  }
}
