import 'package:corail_clone/Data/User.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User _user = User(nom: 'nom', prenom: 'prenom', email: 'email', address: 'address', telephone: 'telephone', ville: 'ville', id: 0, dateNaissance: 1025656);

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}