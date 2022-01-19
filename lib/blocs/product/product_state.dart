part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}


class ProductAddToCartState extends ProductState {}
class ProductRemoveFromCartState extends ProductState {}


