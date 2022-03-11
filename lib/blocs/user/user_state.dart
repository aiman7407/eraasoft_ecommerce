part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserGetDataSuccessState extends UserState {}
class UserGetDataErrorState extends UserState {}

class UserUpdateDataErrorState extends UserState {}
class UserUpdateDataSuccessState extends UserState {}
class UserUpdateDataLoadingState extends UserState {}
