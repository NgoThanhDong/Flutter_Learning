import 'package:flutter/material.dart';
import '../auth_state.dart';
import '../app_routes.dart';

class LoginPage extends StatelessWidget {
  final AuthState authState;

  const LoginPage({
    super.key,
    required this.authState,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('🔑 LoginPage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authState.login();

            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.home,
              (route) => false,
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
