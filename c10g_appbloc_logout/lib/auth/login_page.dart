import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app/app_bloc.dart';
import '../app/app_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🔐 Build LoginPage');

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AppBloc>().add(LoggedIn());
          },
          child: const Text('LOGIN'),
        ),
      ),
    );
  }
}
