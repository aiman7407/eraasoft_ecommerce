import 'package:eraasoft_ecommerce/blocs/login/login_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/views/auth/registeration_view.dart';

import 'package:eraasoft_ecommerce/views/auth/widgets/auth_header.dart';
import 'package:eraasoft_ecommerce/views/auth/widgets/form.dart';
import 'package:eraasoft_ecommerce/views/auth/widgets/social_row.dart';
import 'package:eraasoft_ecommerce/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AuthHeader(isRegister: false,),
                RegsiterForm(
                  formKey: formKey,
                  mailController: cubit.mailController,
                  isRegister: false,
                  passController: cubit.passController,
                ),
                const VerticalSpace(value: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GeneralButton(
                      btnText: 'Continue',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          customNavigator(
                            screen: HomeView(),
                            context: context,
                            finish: false,
                          );
                        }
                      }),
                ),
                const VerticalSpace(
                  value:7.5,
                ),
                SocialRow(),
                const VerticalSpace(
                  value:3,
                ),
                const Text('Don\'t have account? ') ,
                const VerticalSpace(
                  value:3,
                ),
                GeneralButton(
                    btnText: 'Register',
                    function: () {
                      customNavigator(
                        screen: RegistrationView(),
                        context: context,
                        finish: false,
                      );
                    }),

              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    LoginCubit.get(context).passController.dispose();
    LoginCubit.get(context).mailController.dispose();
    super.dispose();
  }
}
