import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {
  AppProvider();

  String? _userName;
  String? _email;

  String get userName {
    return _userName!;
  }

  set userName(String userName) {
    _userName = userName;
  }

  String get email {
    return _email!;
  }

  set email(String email) {
    _email = email;
  }
}
