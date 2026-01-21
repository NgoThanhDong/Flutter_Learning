import 'package:flutter/material.dart';
import '../auth_state.dart';

class LoginPage extends StatelessWidget {
  final AuthState authState;

  const LoginPage({super.key, required this.authState});

  @override
  Widget build(BuildContext context) {
    debugPrint('🔑 LoginPage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authState.login();
            Navigator.of(context)
                .pushReplacementNamed('/home');
          },
          child: const Text('LOGIN'),
        ),
      ),
    );
  }
}
