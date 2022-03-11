import 'package:eraasoft_ecommerce/enums/order_state_enum.dart';
import 'package:eraasoft_ecommerce/models/auth.dart';
import 'package:eraasoft_ecommerce/models/user.dart';

class Order {
  OrderStateEnum state;
  String date;
  Profile ?user;
  double total;


  Order(
      {required this.total,
      required this.state,
      required this.date,
       this.user,

      });
}
