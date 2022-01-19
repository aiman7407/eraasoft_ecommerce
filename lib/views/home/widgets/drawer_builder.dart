import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/views/auth/registeration_view.dart';
import 'package:eraasoft_ecommerce/views/cart/cart_view.dart';
import 'package:eraasoft_ecommerce/views/categories/categories_view.dart';
import 'package:eraasoft_ecommerce/views/home/about_us.dart';
import 'package:flutter/material.dart';
import 'drawer_Item.dart';


class DrawerBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                  )
                ],
              )),

           DrawerItem(
           text: 'Cart', iconData: Icons.shopping_cart,
             function: (){
             customNavigator(context: context, screen:CartView() , finish: true);
             },
          ),
          const ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Favorite'),

          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          DrawerItem(iconData: Icons.shopping_bag,
            text: 'My Orders',
            function: (){
            //TODO: My Order
            },
          ),
          DrawerItem(
            function: (){
              customNavigator(
                finish: true,
                screen:AboutUsView() ,
                context: context,
              );
            },
            iconData: Icons.info_outlined,
            text: 'About Us',
          ),
          DrawerItem(iconData: Icons.category,
            function: (){
              customNavigator(
                screen:CategoriesView() ,
                finish:true ,
                context:context,
              );
            },
            text: 'Categories',
          ),
          DrawerItem(
            text: 'Log Out',
            function: (){
              customNavigator(context: context, screen: RegistrationView(), finish: false);
            },
            iconData:Icons.exit_to_app ,
          ),

        ],
      ),
    );
  }
}
