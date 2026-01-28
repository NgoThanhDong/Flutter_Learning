import 'package:flutter/material.dart';
import 'router/app_go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🏗️ MyApp.build()');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppGoRouter.router,
    );
  }
}
