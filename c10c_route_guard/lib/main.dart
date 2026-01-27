import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app_bloc.dart';
import 'app/app_event.dart';
import 'router/app_router.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => AppBloc()..add(AppStarted()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppRouter(location: '/home'), // 👈 thử đổi /login
    );
  }
}
