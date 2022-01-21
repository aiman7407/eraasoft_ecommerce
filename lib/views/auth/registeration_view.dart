import 'package:eraasoft_ecommerce/blocs/register/register_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/src/functions.dart';
import 'package:eraasoft_ecommerce/views/auth/login_view.dart';
import 'package:eraasoft_ecommerce/views/auth/widgets/auth_header.dart';
import 'package:eraasoft_ecommerce/views/auth/widgets/form.dart';
import 'package:eraasoft_ecommerce/views/auth/widgets/social_row.dart';
import 'package:eraasoft_ecommerce/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationView extends StatefulWidget {
  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController mailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AuthHeader(
                  isRegister: true,
                ),
                RegsiterForm(
                  formKey: formKey,
                  mailController: mailController,
                  nameController: nameController,
                  passController: passController,
                ),
                const VerticalSpace(value: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GeneralButton(
                      btnText: 'Continue',
                      function: () {
                        print(formKey.currentState!.validate());
                        if (formKey.currentState!.validate()) {

                          customNavigator(
                            screen: HomeView(),
                            context: context,
                            finish: false,
                          );
                        }
                      }),
                ),
                const VerticalSpace(
                  value: 1,
                ),
                SocialRow(),
                const VerticalSpace(
                  value: 3,
                ),
                const Text('Already have an account?'),
                const VerticalSpace(
                  value: 3,
                ),
                GeneralButton(
                    btnText: 'Login',
                    function: () {
                      customNavigator(
                        screen: LoginView(),
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

    //TODO: FIX
    // RegisterCubit.get(context).passController.dispose();
    // RegisterCubit.get(context).nameController.dispose();
    // RegisterCubit.get(context).mailController.dispose();
    super.dispose();
  }
}
