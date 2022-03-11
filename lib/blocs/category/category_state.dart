part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoriesSuccessState extends CategoryState {}
class CategoriesErrorState extends CategoryState {}
class CategoriesLoadingState extends CategoryState {}

