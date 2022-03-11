import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/models/product.dart';
import 'package:eraasoft_ecommerce/models/old_product.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_helper.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
import 'package:eraasoft_ecommerce/services/dio_helper/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<OldProduct> cart = [];
  List<Product> newCart = [];
  double total = 0 ;
  double newTotal=0;
  /// OLD WORK !
  addToCart(OldProduct product) {
    cart.add(product);
    emit(ProductAddToCartState());
  }
  removeFromCart(int index) {
    cart.removeAt(index);
    emit(ProductRemoveFromCartState());
  }

  /// NEW WORK

  addToCartNew(Product product) {
    newCart.add(product);
    emit(ProductAddToCartState());
  }
  removeFromCartNew(int index) {
    newCart.removeAt(index);
    emit(ProductRemoveFromCartState());
  }
  getNewTotal()
  {
    newTotal=0;
    for(int i = 0 ; i<newCart.length;i++)
    {
      newTotal+=newCart[i].price!;
    }
    return newTotal;
  }


  getTotal()
  {
    total=0;
    for(int i = 0 ; i<cart.length;i++)
      {
        total+=cart[i].price;
      }
    return total;
  }


  ProductHub ?productHub;
  List<Product> productsByCategory=[];
  void getProductByCategory(int? categoryId) {
    DioHelper.getData(
      query: {
        'category':categoryId
      },
        url: 'product',
        token:CacheHelper.getData(key: CacheKey.TOKEN)
    ).then((value) {
      var jsonData=jsonDecode(value.data);
      productHub = ProductHub.fromJson(jsonData);
      for(var product in productHub!.data!)
      {
        productsByCategory.add(product);
      }
      emit(ProductByCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ProductByCategoriesErrorState());
    });
  }




}
