import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/models/auth.dart';
import 'package:eraasoft_ecommerce/services/dio_helper/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());


  static RegisterCubit get(context)=> BlocProvider.of(context);



  AuthHub? userHub;
   userRegister({
  required  String email, required String password,required String name
  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: 'register',
        data: {
          'name':name,
          'email':email,
          'password':password,
        }).then((value) {
      print(value.data);
      var jsonData=jsonDecode(value.data);
      userHub=AuthHub.fromJson(jsonData);
      print('the value of token = ${userHub!.data!.accessToken}');
      emit(RegisterSuccessState(userHub:userHub));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error: error.toString()));
    });
  }






}
