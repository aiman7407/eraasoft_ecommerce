import 'package:flutter/material.dart';


class DrawerItem extends StatelessWidget {
  final function;
  final  iconData;
  final text;
  DrawerItem({this.function,required this.iconData,this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:function ,
      child:  ListTile(
        leading: Icon(iconData),
        title: Text(
          text,
        ),
      ),
    );
  }
}
