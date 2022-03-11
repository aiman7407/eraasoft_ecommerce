import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraasoft_ecommerce/blocs/category/category_cubit.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesHomeBuilder extends StatelessWidget {

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
                Container(
                  height: SizeConfig.defaultSize! * 12.5,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.categories.length>6?
                      6:cubit.categories.length,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: SizeConfig.defaultSize! * 18,
                            height: SizeConfig.defaultSize! * 12.5,
                            decoration: const BoxDecoration(
                                color: AppColors.klightSilver
                            ),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: 'https://www.lenovo.com/medias/lenovo-laptops-ideapad-5i-15-series-front-thumbnail.png?context=bWFzdGVyfHJvb3R8NTUwNjJ8aW1hZ2UvcG5nfGg1Yy9oZWMvMTEwOTQ1OTc0NjgxOTAucG5nfDc4NTkyNmU3NzUyYzkxYzU4OGI2YjQ4MmI1ZTlmMDc3NmVmOTFhYjI1NjBmZmI0YWJkM2UzMTljZmJlZThhZjU',
                                  height: SizeConfig.defaultSize! * 9,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Image.asset(AppImages.loadingGigs.assetName,),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),

                                Text(cubit.categories[index].name.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
        );
      },
    );
  }
}
