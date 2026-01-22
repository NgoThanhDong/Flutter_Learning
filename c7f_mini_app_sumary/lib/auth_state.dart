import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  bool _loggedIn = false;

  bool get isLoggedIn => _loggedIn;

  void login() {
    debugPrint('🔑 AuthState: login');
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    debugPrint('🚪 AuthState: logout');
    _loggedIn = false;
    notifyListeners();
  }
}
