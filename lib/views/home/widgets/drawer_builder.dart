import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraasoft_ecommerce/blocs/user/user_cubit.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_helper.dart';
import 'package:eraasoft_ecommerce/services/cache_helper/cache_keys.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/views/auth/registeration_view.dart';
import 'package:eraasoft_ecommerce/views/cart/cart_view.dart';
import 'package:eraasoft_ecommerce/views/categories/categories_view.dart';
import 'package:eraasoft_ecommerce/views/favorite/wishlist_view.dart';
import 'package:eraasoft_ecommerce/views/home/about_us.dart';
import 'package:eraasoft_ecommerce/views/my_order/my_order_view.dart';
import 'package:eraasoft_ecommerce/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'drawer_Item.dart';

class DrawerBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit=UserCubit.get(context);
              return BuildCondition(
                condition:cubit.userHub!=null ,
                fallback:(context)=> LinearProgressIndicator(),
                builder: (context)=>
                    DrawerHeader(
                    decoration: const BoxDecoration(
                      color: AppColors.kPrimaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            cubit.userHub!.data!.profile!.name.toString(),
                            style:const  TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl: cubit.userHub!.data!.profile!.image!,
                          imageBuilder: (context, imageProvider) => CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 45,
                          ),
                          placeholder: (context, url) => Image.asset(
                            AppImages.loadingGigs.assetName,
                            height: 45,
                            width: 45,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ],
                    )),
              );
            },
          ),

          DrawerItem(
            text: 'Cart',
            iconData: Icons.shopping_cart,
            function: () {
              AppNavigator.customNavigator(
                  context: context, screen: CartView(), finish: false);
            },
          ),
          DrawerItem(
            text: 'Favorite Item',
            iconData: Icons.favorite_border,
            function: () {
              AppNavigator.customNavigator(
                  context: context, screen: FavoriteView(), finish: false);
            },
          ),
          // const ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          // ),
          DrawerItem(
            iconData: Icons.shopping_bag,
            text: 'My Orders',
            function: () {
              AppNavigator.customNavigator(
                  context: context, screen: MyOrderView(), finish: false);
            },
          ),
          DrawerItem(
            function: () {
              AppNavigator.customNavigator(
                finish: false,
                screen: AboutUsView(),
                context: context,
              );
            },
            iconData: Icons.info_outlined,
            text: 'About Us',
          ),
          DrawerItem(
            iconData: Icons.category,
            function: () {
              AppNavigator.customNavigator(
                screen: CategoriesView(),
                finish: false,
                context: context,
              );
            },
            text: 'Categories',
          ),
          DrawerItem(
            text: 'Profile',
            function: () {
              AppNavigator.customNavigator(
                  context: context, screen: ProfileView(), finish: false);
            },
            iconData: Icons.person,
          ),
          DrawerItem(
            text: 'Log Out',
            function: () {
              CacheHelper.removeData(key: CacheKey.TOKEN).then((value) {
                AppNavigator.customNavigator(
                    context: context, screen: RegistrationView(), finish: true);
              });
            },
            iconData: Icons.exit_to_app,
          ),
        ],
      ),
    );
  }
}
