import 'package:eraasoft_ecommerce/enums/order_state_enum.dart';
import 'package:eraasoft_ecommerce/models/user.dart';

class Order {
  OrderStateEnum state;
  String date;
  User user;
  double total;
  String address;

  Order(
      {required this.total,
      required this.state,
      required this.date,
      required this.user,
      required this.address
      });
}
