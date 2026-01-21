import 'package:flutter/material.dart';
import '../auth_state.dart';

class HomePage extends StatelessWidget {
  final AuthState authState;

  const HomePage({super.key, required this.authState});

  @override
  Widget build(BuildContext context) {
    debugPrint('🏠 HomePage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authState.logout();
            Navigator.of(context)
                .pushReplacementNamed('/login');
          },
          child: const Text('LOGOUT'),
        ),
      ),
    );
  }
}
