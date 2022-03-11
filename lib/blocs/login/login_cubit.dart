import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/models/auth.dart';
import 'package:eraasoft_ecommerce/services/dio_helper/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=> BlocProvider.of(context);




  AuthHub? userHub;
  userLogin({
    required  String email, required String password
  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'login',
        data: {
          'email':email,
          'password':password,
        }).then((value) {
      print(value.data);
      userHub=AuthHub.fromJson(value.data);
      print('the value of token = ${userHub!.data!.accessToken}');
      emit(LoginSuccessState(userHub:userHub));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error: error.toString()));
    });
  }




}
