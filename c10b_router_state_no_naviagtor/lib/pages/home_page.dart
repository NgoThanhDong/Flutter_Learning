import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app/app_bloc.dart';
import '../app/app_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AppBloc>().add(LoggedOut());
          },
          child: const Text('LOGOUT'),
        ),
      ),
    );
  }
}
