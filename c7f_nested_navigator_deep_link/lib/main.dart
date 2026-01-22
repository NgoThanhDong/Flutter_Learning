import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'pages/home_shell_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 MyApp build');

    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        debugPrint('➡️ ROOT onGenerateRoute: ${settings.name}');
        final path = parseRoute(settings.name);

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => HomeShellPage(initialPath: path),
        );
      },
    );
  }
}
