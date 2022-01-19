import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;
  final fieldName;

  CustomTextField(
      {required this.fieldName,
      required this.iconData,
      required this.hintText,
      required this.controller,
      this.isObsecure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(iconData),
        hintText: hintText,
      ),
      validator: (String? value) {
        return (value == null || value.isEmpty) ? 'You must Enter Your $fieldName' : null;
      },
    );
  }
}
