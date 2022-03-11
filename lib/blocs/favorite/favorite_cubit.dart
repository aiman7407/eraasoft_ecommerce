import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/models/old_product.dart';
import 'package:eraasoft_ecommerce/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context)=>BlocProvider.of(context);

  // List<OldProduct> favoriteProducts=[];
  //
  //
  // addToFavorite(OldProduct product){
  //   favoriteProducts.add(product);
  //  product.isFavorite=true;
  //   emit(FavoriteAddToFavoriteState());
  // }
  // removeFromFavorite(OldProduct product){
  //   favoriteProducts.removeWhere((element) => element.id==product.id);
  //  product.isFavorite=false;
  //   emit(FavoriteRemoveFromFavoriteState());
  // }

  List<Product> favoriteProducts=[];


  addToFavorite(Product product){
    favoriteProducts.add(product);
    product.isFavorite=true;
    emit(FavoriteAddToFavoriteState());
  }
  removeFromFavorite(Product product){
    favoriteProducts.removeWhere((element) => element.id==product.id);
    product.isFavorite=false;
    emit(FavoriteRemoveFromFavoriteState());
  }


}
