import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context)=>BlocProvider.of(context);

  List<Product> favoriteProducts=[];
  bool isFavorite=false;

  addToFavorite(Product product){
    favoriteProducts.add(product);
    isFavorite=true;
    emit(FavoriteAddToFavoriteState());
  }


}
