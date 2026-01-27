import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/app_bloc.dart';
import '../app/app_state.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';
import 'go_router_refresh_notifier.dart';

class AppGoRouter {
  static GoRouter create(AppBloc appBloc) {
    return GoRouter(
      initialLocation: '/login',

      /// 🔥 Router sẽ rebuild khi AppBloc đổi state
      refreshListenable: GoRouterRefreshNotifier(appBloc.stream),

      redirect: (context, state) {
        final appState = appBloc.state;
        final location = state.uri.toString();

        debugPrint('--- ROUTER REDIRECT ---');
        debugPrint('AppState: $appState');
        debugPrint('Location: $location');

        // App đang khởi động
        if (appState is AppInitializing) {
          debugPrint('⏳ App initializing');
          return location == '/login' ? null : '/login';
        }

        // Chưa login
        if (appState is Unauthenticated) {
          if (location == '/home') {
            debugPrint('🚫 Not logged in → /login');
            return '/login';
          }
        }

        // Đã login
        if (appState is Authenticated) {
          if (location == '/login') {
            debugPrint('✅ Logged in → /home');
            return '/home';
          }
        }

        debugPrint('✅ No redirect');
        return null;
      },

      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) {
            debugPrint('🧱 Build LoginPage');
            return const LoginPage();
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            debugPrint('🧱 Build HomePage');
            return const HomePage();
          },
        ),
      ],
    );
  }
}
