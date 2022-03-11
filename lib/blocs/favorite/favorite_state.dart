part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class FavoriteAddToFavoriteState extends FavoriteState {}
class FavoriteRemoveFromFavoriteState extends FavoriteState {}
