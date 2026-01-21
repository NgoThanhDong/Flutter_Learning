import 'package:flutter/material.dart';
import 'home_page.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 🔑 Route khởi đầu
      initialRoute: '/',

      // 🔑 Bảng route trung tâm
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
      },

      // 🔍 Debug route change
      navigatorObservers: [
        RouteLogger(),
      ],
    );
  }
}

/// 🔍 Observer để debug navigation (production rất hay dùng)
class RouteLogger extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('➡️ Push route: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('⬅️ Pop route: ${route.settings.name}');
  }
}
