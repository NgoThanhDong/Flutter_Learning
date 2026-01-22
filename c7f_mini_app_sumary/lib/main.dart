import 'package:flutter/material.dart';
import 'auth_state.dart';
import 'app_routes.dart';
import 'pages/splash_page.dart';
import 'pages/login_page.dart';
import 'pages/home_shell_page.dart';
import 'pages/unknown_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthState authState = AuthState();

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 MyApp build (loggedIn=${authState.isLoggedIn})');

    return AnimatedBuilder(
      animation: authState,
      builder: (_, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: (settings) {
            debugPrint(
              '➡️ onGenerateRoute: ${settings.name}, args=${settings.arguments}',
            );

            // 🔐 AUTH GUARD
            if (!authState.isLoggedIn &&
                settings.name != AppRoutes.login &&
                settings.name != AppRoutes.splash) {
              debugPrint('⛔ Blocked ${settings.name} → /login');
              return _route(
                LoginPage(authState: authState),
                AppRoutes.login,
              );
            }

            switch (settings.name) {
              case AppRoutes.splash:
                return _route(
                  SplashPage(authState: authState),
                  AppRoutes.splash,
                );

              case AppRoutes.login:
                return _route(
                  LoginPage(authState: authState),
                  AppRoutes.login,
                );

              case AppRoutes.home:
                return _route(
                  HomeShellPage(authState: authState),
                  AppRoutes.home,
                );

              default:
                return null;
            }
          },
          onUnknownRoute: (settings) {
            debugPrint('🚨 Unknown route: ${settings.name}');
            return _route(const UnknownPage(), '/unknown');
          },
        );
      },
    );
  }

  MaterialPageRoute _route(Widget page, String name) {
    debugPrint('➡️ PUSH $name');
    return MaterialPageRoute(
      settings: RouteSettings(name: name),
      builder: (_) => page,
    );
  }
}
