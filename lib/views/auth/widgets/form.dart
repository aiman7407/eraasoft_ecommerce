import 'package:eraasoft_ecommerce/core/components/custom_text_field.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:flutter/material.dart';

class RegsiterForm extends StatelessWidget {
  final formKey;
  final nameController;
  final mailController;
  final passController;
  final isRegister;

  RegsiterForm(
      {this.formKey,
      this.nameController,
      this.mailController,
      this.passController,
      this.isRegister = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            isRegister
                ? CustomTextField(
                    hintText: 'Full Name',
                    iconData: Icons.person,
                    controller: nameController,
                    fieldName: 'Full Name',
                  )
                : Container(),
            const VerticalSpace(value: 3),
            CustomTextField(
              fieldName: 'E-mail',
              hintText: 'Your E-mail',
              iconData: Icons.email,
              controller: mailController,
            ),
            const VerticalSpace(value: 3),
            CustomTextField(
              fieldName: 'Password',
              hintText: 'Your Password',
              iconData: Icons.lock,
              controller: passController,
              isObsecure: true,
            ),
          ],
        ),
      ),
    );
  }
}
