import 'package:flutter/material.dart';
import 'auth_state.dart';
import 'pages/splash_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
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
          initialRoute: '/',
          onGenerateRoute: (settings) {
            debugPrint('➡️ onGenerateRoute: ${settings.name}');
            return _onGenerateRoute(settings);
          },
          onUnknownRoute: (settings) {
            debugPrint('🚨 onUnknownRoute: ${settings.name}');
            return _route(const UnknownPage(), '/unknown');
          },
        );
      },
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    final name = settings.name;

    // ✅ AUTH GUARD CHỈ Ở ROOT
    if (name == '/') {
      return _route(
        SplashPage(authState: authState),
        '/',
      );
    }

    switch (name) {
      case '/login':
        return _route(
          LoginPage(authState: authState),
          '/login',
        );
      case '/home':
        return _route(
          HomePage(authState: authState),
          '/home',
        );
      default:
        return _route(const UnknownPage(), '/unknown');
    }
  }

  MaterialPageRoute _route(Widget page, String name) {
    debugPrint('➡️ PUSH $name');
    return MaterialPageRoute(
      settings: RouteSettings(name: name),
      builder: (_) => page,
    );
  }
}
