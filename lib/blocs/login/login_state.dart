part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  final AuthHub ?userHub;

LoginSuccessState({  this.userHub});

}
class LoginErrorState extends LoginState {

  final String ?error;

 LoginErrorState({ this.error});
}
