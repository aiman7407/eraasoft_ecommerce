part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}


class ProductAddToCartState extends ProductState {}
class ProductRemoveFromCartState extends ProductState {}


///Products by categories
class ProductByCategoriesSuccessState extends ProductState {}
class ProductByCategoriesErrorState extends ProductState {}


