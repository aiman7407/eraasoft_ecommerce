
import 'package:flutter/material.dart';


//TODO: Fix Logic
customNavigator({required context, required screen, required bool finish})
{
  finish?
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen)):
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(

      builder: (BuildContext context) => screen,
    ),
        (route) => false,
  );



}