import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app_bloc.dart';
import 'app/app_event.dart';
import 'router/app_go_router.dart';

void main() {
  final appBloc = AppBloc()..add(AppStarted());

  runApp(
    BlocProvider.value(
      value: appBloc,
      child: MyApp(appBloc: appBloc),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppBloc appBloc;

  const MyApp({super.key, required this.appBloc});

  @override
  Widget build(BuildContext context) {
    final router = AppGoRouter.create(appBloc);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
