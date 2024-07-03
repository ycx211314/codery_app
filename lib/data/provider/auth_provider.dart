// Using a state management solution (example with Provider)
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _signInSuccess = false;

  bool get signInSuccess => _signInSuccess;

  void signIn() {
    // Perform sign-in logic
    _signInSuccess = true;
    notifyListeners();
  }
}
