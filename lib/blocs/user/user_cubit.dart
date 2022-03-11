import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/models/user.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_helper.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
import 'package:eraasoft_ecommerce/services/dio_helper/dio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  UserHub? userHub;

  getUserData() {
    DioHelper.getData(
            token: CacheHelper.getData(key: CacheKey.TOKEN), url: 'profile')
        .then((value) {
      var jsonData = jsonDecode(value.data);
      userHub = UserHub.fromJson(jsonData);
      if (userHub!.data!.profile!.image == null) {
        userHub!.data!.profile!.image =
            'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg';
      }
      emit(UserGetDataSuccessState());
    }).catchError((error) {
      emit(UserGetDataErrorState());
    });
  }

  updateUserData(String address,String phone,String password) {
    emit(UserUpdateDataLoadingState());
    DioHelper.postData(
      token: CacheHelper.getData(key: CacheKey.TOKEN),
        url: 'profile/52',
        data: {
        '_method':'PUT',
      'address':address,
      'phone':phone,
      'password':password
    }
    ).then((value) {

          getUserData();
          emit(UserUpdateDataSuccessState());
    })
        .catchError((error) {
          print((error));
          emit(UserUpdateDataLoadingState());
    });
  }
}
