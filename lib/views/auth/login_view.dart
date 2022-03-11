import 'package:buildcondition/buildcondition.dart';
import 'package:eraasoft_ecommerce/blocs/login/login_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/toast/toast.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/enums/toast_state_enum.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_helper.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
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
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.userHub!.status == 200) {
            CacheHelper.saveData(
                key: CacheKey.TOKEN,
                value: state.userHub!.data!.accessToken)
                .then((value) {
              AppNavigator.customNavigator(
                  context: context, screen: HomeView(), finish: true);
            });
            print(state.userHub!.data!.tokenType);
          } else {
            print(state.userHub!.message);
            ToastConfig.showToast(
                msg: state.userHub!.message.toString(),
                toastStates: ToastStates.Error);
          }
        }

      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                VerticalSpace(value: SizeConfig.defaultSize! * 0.5),
                AuthHeader(
                  isRegister: false,
                ),
                RegsiterForm(
                  formKey: formKey,
                  mailController: mailController,
                  isRegister: false,
                  passController: passController,
                ),
                const VerticalSpace(value: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BuildCondition(
                    condition:state is! LoginLoadingState ,
                    fallback: (context){
                      return const LinearProgressIndicator();
                    } ,
                    builder:  (context){
                      return  GeneralButton(
                          btnText: 'Login now !',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: mailController.text.trim(),
                                  password: passController.text.trim());

                            }
                          });
                    } ,
                  )
                ),
                const VerticalSpace(
                  value: 6,
                ),
                SocialRow(),
                const VerticalSpace(
                  value: 3.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t? have an account?'),
                    TextButton(
                      child: const Text('Press here to Signup'),
                      onPressed: () {
                        AppNavigator.customNavigator(
                          screen: RegistrationView(),
                          context: context,
                          finish: true,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    passController.dispose();
    mailController.dispose();
    super.dispose();
  }
}
