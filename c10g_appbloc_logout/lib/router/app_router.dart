import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app/app_bloc.dart';
import '../app/app_state.dart';
import '../auth/login_page.dart';
import '../home/home_page.dart';

class AppRouter extends ChangeNotifier {
  final AppBloc appBloc;

  AppRouter(this.appBloc) {
    appBloc.stream.listen((_) {
      debugPrint('🔄 AppState changed → notifyRouter');
      notifyListeners();
    });
  }

  late final GoRouter router = GoRouter(
    initialLocation: '/login',
    refreshListenable: this,
    routes: [
      GoRoute(
        path: '/login',
        builder: (_, _) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, _) => const HomePage(),
      ),
    ],
    redirect: (_, state) {
      final loggedIn = appBloc.state.status == AppStatus.authenticated;
      final isLogin = state.matchedLocation == '/login';

      debugPrint(
        '🧭 Redirect | loggedIn=$loggedIn | location=${state.matchedLocation}',
      );

      if (!loggedIn && !isLogin) return '/login';
      if (loggedIn && isLogin) return '/home';
      return null;
    },
  );
}
