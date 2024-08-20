import 'package:corail_clone/Data/User.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User _user = User(firstName: 'tst', lastName: 'tst');

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}