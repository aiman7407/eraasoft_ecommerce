import 'package:buildcondition/buildcondition.dart';
import 'package:eraasoft_ecommerce/blocs/register/register_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/toast/toast.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/enums/toast_state_enum.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_helper.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
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

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.userHub!.status == 201) {
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
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                VerticalSpace(value: SizeConfig.defaultSize! * 0.6),
                AuthHeader(
                  isRegister: true,
                ),
                RegsiterForm(
                  formKey: formKey,
                  mailController: mailController,
                  nameController: nameController,
                  passController: passController,
                  confirmPassController: confirmPassController,
                ),
                const VerticalSpace(value: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BuildCondition(
                    condition: state is! RegisterLoadingState,
                    fallback: (context) => const LinearProgressIndicator(),
                    builder: (context) => GeneralButton(
                        btnText: 'Register now',
                        function: () {
                          print(formKey.currentState!.validate());
                          if (formKey.currentState!.validate()) {
                            cubit.userRegister(
                                email: mailController.text.trim(),
                                password: passController.text.trim(),
                                name: nameController.text.trim());
                          }
                        }),
                  ),
                ),
                const VerticalSpace(value: 2),
                SocialRow(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      child: const Text('Press here to Sign in'),
                      onPressed: () {
                        AppNavigator.customNavigator(
                          screen: LoginView(),
                          context: context,
                          finish: true,
                        );
                      },
                    ),
                  ],
                ),
                const VerticalSpace(
                  value: 1,
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
    nameController.dispose();
    mailController.dispose();
    super.dispose();
  }
}
