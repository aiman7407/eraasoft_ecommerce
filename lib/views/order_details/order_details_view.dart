import 'package:eraasoft_ecommerce/blocs/order/order_cubit.dart';
import 'package:eraasoft_ecommerce/core/components/button.dart';
import 'package:eraasoft_ecommerce/core/components/space.dart';
import 'package:eraasoft_ecommerce/core/toast/toast.dart';
import 'package:eraasoft_ecommerce/core/utils/naviagtion.dart';
import 'package:eraasoft_ecommerce/core/utils/size_config.dart';
import 'package:eraasoft_ecommerce/enums/toast_state.dart';
import 'package:eraasoft_ecommerce/models/order.dart';
import 'package:eraasoft_ecommerce/src/app_colors.dart';
import 'package:eraasoft_ecommerce/src/app_consts.dart';
import 'package:eraasoft_ecommerce/views/my_order/my_order_view.dart';
import 'package:eraasoft_ecommerce/views/order_details/widgets/order_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class OrderDetailsView extends StatelessWidget {
  OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Content of order'),),
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit= OrderCubit.get(context);
          //pass the last element
          Order lastOrder = cubit.myOrders[cubit.myOrders.length-1];
          return Column(
            children: [

              OrderDetailsCard(value: lastOrder.date ,lable:'Order date' ,),
              OrderDetailsCard(value: lastOrder.user.name ,lable:'Delegate name' ,),
              OrderDetailsCard(value: lastOrder.address ,lable:'Address' ,),
              Image.asset(AppImages.mapsImage.assetName,
                height: SizeConfig.defaultSize!*15,
                width: double.infinity,
              ),
              Container(
                height: SizeConfig.defaultSize!*7,
                decoration: const BoxDecoration(
                  color: AppColors.kPrimarySilverColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    const Text('Order Cost',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    Text(lastOrder.total.toString()+' EGP',
                    style: const TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                    ),

                  ],
                ),
              ),
              VerticalSpace(value: SizeConfig.defaultSize!*1.31),
              GeneralButton(btnText: 'Submit order', function: (){
                customNavigator(context: context, screen: MyOrderView(), finish: false);
                ToastConfig.showToast(msg: 'we are processing your order', toastStates: ToastStates.Success);

              })

            ],
          );
        },
      ),

    );
  }
}

