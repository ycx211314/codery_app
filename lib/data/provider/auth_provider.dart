// Using a state management solution (example with Provider)
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthorityProvider with ChangeNotifier {
  bool _signInSuccess = false;

  User? _user;

  User? get user => _user;

  void setUser(User user) {
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
