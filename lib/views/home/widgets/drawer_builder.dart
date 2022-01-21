import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/views/auth/registeration_view.dart';
import 'package:eraasoft_ecommerce/views/cart/cart_view.dart';
import 'package:eraasoft_ecommerce/views/categories/categories_view.dart';
import 'package:eraasoft_ecommerce/views/favorite/wishlist_view.dart';
import 'package:eraasoft_ecommerce/views/home/about_us.dart';
import 'package:eraasoft_ecommerce/views/my_order/my_order_view.dart';
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
                color: AppColors.kPrimaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'User Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage('https://icon-library.com/images/person-image-icon/person-image-icon-6.jpg',
                    ),
                  )
                ],
              )),

           DrawerItem(
           text: 'Cart', iconData: Icons.shopping_cart,
             function: (){
             customNavigator(context: context, screen:CartView() , finish: true);
             },
          ),
          DrawerItem(
            text: 'Favorite Item', iconData: Icons.favorite_border,
            function: (){
              customNavigator(context: context, screen:FavoriteView() , finish: true);
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          DrawerItem(iconData: Icons.shopping_bag,
            text: 'My Orders',
            function: (){
            customNavigator(context: context, screen: MyOrderView(), finish: true);
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
