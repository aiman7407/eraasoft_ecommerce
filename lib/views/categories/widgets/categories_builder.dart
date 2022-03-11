import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraasoft_ecommerce/blocs/category/category_cubit.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/src/dummy_data.dart';
import 'package:eraasoft_ecommerce/views/categories/widgets/category_card.dart';
import 'package:eraasoft_ecommerce/views/products_by_category/producyts_by_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({Key? key}) : super(key: key);



/// CORRENT ONE
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=CategoryCubit.get(context);

        return  BuildCondition(
            condition: cubit.categoriesHub != null &&
                cubit.categoriesHub!.status == 200,
            fallback: (context) => LinearProgressIndicator(),
            builder: (context) =>
                Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.categories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            AppNavigator.customNavigator(
                                context: context,
                                screen: ProductsByCategoryView(productId: cubit.categories[index].id,
                                productName: cubit.categories[index].name,
                                ),
                                finish: false);
                          },
                          child: CategoryCard(text: cubit.categories[index].name,
                            //TODO: FIX IMAGES FROM BACKEND
                            image: 'https://chronicle.durhamcollege.ca/wp-content/uploads/2021/01/ps5-photo.png',
                          ),
                        );
                      }),
                )
        );
      },
    );
  }

}
