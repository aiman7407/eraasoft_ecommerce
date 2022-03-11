import 'package:bloc/bloc.dart';
import 'package:eraasoft_ecommerce/enums/order_state_enum.dart';
import 'package:eraasoft_ecommerce/models/order.dart';
import 'package:eraasoft_ecommerce/models/auth.dart';
import 'package:eraasoft_ecommerce/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  List<Order> myOrders = [
    Order(
        total: 134, state: OrderStateEnum.Canceled,
        date: '17 Nov 2021',
        user:Profile(
        address: '140 El Merghany Street, Heliopolis' ,
          name: 'Aiman',
        ),
    ),
    Order(
        total: 2072, state: OrderStateEnum.Received,
        date: '19 Dec 2022',
        user:Profile(
          address: '190 El Merghany Street, Heliopolis' ,
          name: 'Aiman',
        ),
        ),
  ];

  addOrder(Order order)
  {
    myOrders.add(order);
    emit(OrderAddState());
  }

}
