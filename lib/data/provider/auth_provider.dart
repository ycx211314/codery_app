// Using a state management solution (example with Provider)
import 'package:codery/data/models/account.dart';
import 'package:flutter/material.dart';

class AuthorityProvider with ChangeNotifier {
  bool _signInSuccess = false;

  Account? _user;

  Account? get user => _user;

  void setUser(Account user) {
    _user = user;
    notifyListeners();
  }

  bool get signInSuccess => _signInSuccess;

  void signIn() {
    _signInSuccess = true;
    notifyListeners();
  }

  void logout() {
    _signInSuccess = false;
    _user = null;
    notifyListeners();
  }
}
