import 'package:buildcondition/buildcondition.dart';
import 'package:eraasoft_ecommerce/blocs/product/product_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/product_card.dart';
import 'package:eraasoft_ecommerce/views/products_by_category/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductsByCategoryView extends StatefulWidget {
  final int ?productId;
  final String ?productName ;
  ProductsByCategoryView({ this.productName,this.productId});

  @override
  State<ProductsByCategoryView> createState() => _ProductsByCategoryViewState();
}

class _ProductsByCategoryViewState extends State<ProductsByCategoryView> {
  @override
  void initState() {
    ProductCubit.get(context).getProductByCategory(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Align(
          alignment: Alignment.centerRight,
          child: Text(widget.productName.toString())),

      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit= ProductCubit.get(context);
          return BuildCondition(
            condition: cubit.productHub!= null &&
                cubit.productHub!.status == 200,
            //TODO: CHANGE FROM CIRCULAR PROGRESS TO GIF
            fallback: (context)=>const Center(child:  CircularProgressIndicator()),
            builder:  (context)=> GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.productsByCategory.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: cubit.productsByCategory[index] ,
                  );

                    //ProductCardByCategory(product: cubit.productsByCategory[index],);
                }),
          );
        },
      ),
    );
  }
}
