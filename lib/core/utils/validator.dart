//
// class Validator {
//   static String validateEmail(String email) {
//     if (email == null || email.isEmpty)
//       return tr("empty_field_not_valid");
//     else if (_checkInvalidEmail(email))
//       return tr("invalid_email_address");
//     else
//       return null;
//   }
//
//   static bool _checkInvalidEmail(String email) {
//     RegExp regExp = RegExp(
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//     return !regExp.hasMatch(email);
//   }
//
//   static String validatePassword(String password) {
//     if (password == null || password.isEmpty)
//       return tr("empty_field_not_valid");
//     else if (password.length < 8)
//       return tr("invalid_password_less_than_characters");
//     else if (!password.contains(RegExp(r'[a-zA-Z@$!%*#?&]')))
//       return tr("password_must_contains_characters");
//     else if (!password.contains(RegExp(r'[0-9]')))
//       return tr("password_must_contains_numbers");
//     else
//       return null;
//   }
//
//   static String validateConfPassword(String password, String confPassword) {
//     if (password == null || password.isEmpty || password != confPassword)
//       return tr("does_not_match_with_password");
//     else
//       return null;
//   }
//
//   static String validatePhoneNumber(String phoneNumber) {
//     if (phoneNumber == null || phoneNumber.isEmpty)
//       return tr("empty_field_not_valid");
//     else if (!RegExp(r"(01)[0-9]{9,9}$").hasMatch(phoneNumber))
//       return tr("invalid_phone_number");
//     else
//       return null;
//   }
//   static String validateEmptyField(String text) {
//     if (text == null || text.isEmpty)
//       return tr("empty_field_not_valid");
//     else
//       return null;
//   }
//
//   static String validateUserName(String userName) {
//     if (userName == null || userName.isEmpty)
//       return tr("empty_field_not_valid");
//     else if (userName.length < 3)
//       return tr('must_be_at_least_3');
//     else
//       return null;
//   }
//
//   static String validateBirthDate(String birthdate) {
//     if (birthdate == null || birthdate.isEmpty)
//       return tr("empty_field_not_valid");
//     else if (_checkIfNotAllowedAge(birthdate))
//       return tr("not_allowed_for_users_under_years_old");
//     else
//       return null;
//   }
//
//   static bool _checkIfNotAllowedAge(String birthdate) {
//     DateTime currentDate = DateTime.now();
//     DateTime userBirthDate = DateTime.parse(birthdate);
//     int userAge = (currentDate.difference(userBirthDate).inDays) ~/ 365;
//     int allowedAge = 18;
//     return userAge < allowedAge;
//   }
// }
//
// import 'dart:io';
// import 'dart:async';
//
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/foundation.dart';
// import 'package:rxdart/rxdart.dart';
//
// class ConnectionChecker {
//   static final ConnectionChecker _singleton = ConnectionChecker._internal();
//   ConnectionChecker._internal();
//   factory ConnectionChecker() => _singleton;
//
//   bool _hasConnection;
//   bool get hasConnection => _hasConnection;
//
//   final _connectionChangeController = BehaviorSubject<bool>();
//   final _connectivity = Connectivity();
//
//   Future<void> initialize() async {
//     _connectivity.onConnectivityChanged.listen(_connectionChange);
//     _checkConnection(await _connectivity.checkConnectivity());
//   }
//
//   Stream<bool> get connectionChange => _connectionChangeController.stream;
//
//   void _connectionChange(ConnectivityResult result) {
//     _checkConnection(result);
//   }
//
//   Future<bool> _checkConnection(ConnectivityResult result) async {
//     if (kIsWeb) {
//       _hasConnection = true;
//       _connectionChangeController.add(_hasConnection);
//     }
//     bool previousConnection = _hasConnection;
//     if (_hasConnection == null) {
//       _hasConnection = false;
//       _connectionChangeController.add(_hasConnection);
//     }
//     if (result == ConnectivityResult.none) {
//       _hasConnection = false;
//       if (previousConnection != _hasConnection)
//         _connectionChangeController.add(_hasConnection);
//       return _hasConnection;
//     }
//
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         _hasConnection = true;
//       } else {
//         _hasConnection = false;
//       }
//     } on SocketException catch (_) {
//       _hasConnection = false;
//     }
//
//     if (previousConnection != _hasConnection)
//       _connectionChangeController.add(_hasConnection);
//
//     return _hasConnection;
//   }
//
//   void dispose() {
//     _connectionChangeController.close();
//   }
// }
//
