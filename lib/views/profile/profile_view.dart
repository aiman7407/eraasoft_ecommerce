import 'package:eraasoft_ecommerce/blocs/user/user_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/toast/toast.dart';
import 'package:eraasoft_ecommerce/enums/toast_state_enum.dart';
import 'package:eraasoft_ecommerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {


  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var addressController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserState>(
      listener: (context, state) {
        if(state is UserUpdateDataSuccessState)
          {
            ToastConfig.showToast(msg: 'Updated Successfully', toastStates: ToastStates.Success);
          }
      },
      builder: (context, state) {
        var cubit=UserCubit.get(context);
        Profile user= cubit.userHub!.data!.profile!;
        nameController.text=user.name!;
        phoneController.text=user.phone??'';
        addressController.text=user.address??'';

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:const  Text('Edit your profile'),
          ),
          body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  CircleAvatar(
                    backgroundImage: NetworkImage(cubit.userHub!.data!.profile!.image!),
                    radius:100,
                  ),
                 SizedBox(
                   height: 100,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: nameController,
                     decoration: InputDecoration(
                         labelText:'Name',
                         prefixIcon: Icon(Icons.person),
                         border: OutlineInputBorder()
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: phoneController,
                     decoration: InputDecoration(
                         labelText:'Phone Number',
                         prefixIcon: Icon(Icons.phone),
                         border: OutlineInputBorder()
                     ),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                          labelText:'Address',
                          prefixIcon: Icon(Icons.location_pin),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText:'Password',
                          prefixIcon: Icon(Icons.vpn_key),
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),

                  GeneralButton(
                      btnText:'Edit Info', function:(){
                    cubit.updateUserData(addressController.text, phoneController.text, passwordController.text);
                  }),
                  if(state is UserUpdateDataLoadingState)
                    const LinearProgressIndicator()

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
