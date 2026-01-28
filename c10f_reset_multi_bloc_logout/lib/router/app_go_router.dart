import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/detail_screen.dart';

class AppGoRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true, // 👈 cực kỳ quan trọng cho debug
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          debugPrint('📍 GoRoute: HOME');
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          debugPrint('📍 GoRoute: DETAIL');
          return const DetailScreen();
        },
      ),
    ],
    errorBuilder: (context, state) {
      debugPrint('❌ Route error: ${state.error}');
      return const Scaffold(
        body: Center(child: Text('Route error')),
      );
    },
  );
}
