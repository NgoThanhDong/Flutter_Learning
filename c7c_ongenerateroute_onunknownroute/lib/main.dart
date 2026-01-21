import 'package:flutter/material.dart';
import 'home_page.dart';
import 'detail_page.dart';
import 'unknown_page.dart';

void main() {
  runApp(const MyApp());
}

/// =======================
/// ROOT APP
/// =======================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 🔑 Route khởi đầu (deep link sẽ override)
      initialRoute: '/',

      // ❌ KHÔNG dùng routes:

      // ✅ Route factory trung tâm
      onGenerateRoute: _onGenerateRoute,

      // 🚨 Route fallback khi không match
      onUnknownRoute: _onUnknownRoute,

      // 🔍 Debug navigation
      navigatorObservers: [RouteLogger()],
    );
  }
}

/// =======================
/// ROUTE FACTORY
/// =======================
Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
  debugPrint(
    '➡️ onGenerateRoute: ${settings.name} with args: ${settings.arguments}',
  );

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const HomePage(),
      );

    case '/detail':
      final args = settings.arguments;

      // ✅ Validate arguments
      if (args is String) {
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DetailPage(itemName: args),
        );
      }

      // ❌ Argument sai → Unknown
      return _errorRoute(settings, 'Invalid arguments for /detail');

    default:
      // ❌ Route name không tồn tại
      return null;
  }
}

/// =======================
/// UNKNOWN ROUTE (ROUTE NAME SAI)
/// =======================
Route<dynamic> _onUnknownRoute(RouteSettings settings) {
  debugPrint('🚨 onUnknownRoute: ${settings.name}');

  return MaterialPageRoute(
    settings: settings,
    builder: (_) => UnknownPage(message: 'Route "${settings.name}" not found'),
  );
}

/// =======================
/// ERROR ROUTE (ARGUMENT SAI)
/// =======================
Route<dynamic> _errorRoute(RouteSettings settings, String message) {
  debugPrint('❌ _errorRoute: $message');

  return MaterialPageRoute(
    settings: settings,
    builder: (_) => UnknownPage(message: message),
  );
}

/// =======================
/// NAVIGATION OBSERVER
/// =======================
class RouteLogger extends NavigatorObserver {
  RouteLogger();

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('➡️ PUSH ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('⬅️ POP ${route.settings.name}');
  }
}
