import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  AppProvider();

  String? _userName;
  String? _mobileNumber;
  String? _email;

  String get userName {
    return _userName ?? "no data";
  }

  set userName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  String get email {
    return _email ?? "no data";
  }

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String get mobileNumber {
    return _mobileNumber ?? "no data";
  }

  set mobileNumber(String mobileNumber) {
    _mobileNumber = mobileNumber;
    notifyListeners();
  }
}
