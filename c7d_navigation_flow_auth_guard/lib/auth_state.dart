import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    debugPrint('🔐 AuthState: login');
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    debugPrint('🔓 AuthState: logout');
    notifyListeners();
  }
}
