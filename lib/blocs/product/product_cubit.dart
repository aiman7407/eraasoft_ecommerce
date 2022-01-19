import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<Product> cart = [];
  double total = 0 ;
  addToCart(Product product) {
    cart.add(product);
    emit(ProductAddToCartState());
  }

  removeFromCart(int index) {
    cart.removeAt(index);
    emit(ProductRemoveFromCartState());
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
}
