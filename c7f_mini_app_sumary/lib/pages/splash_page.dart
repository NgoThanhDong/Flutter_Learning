import 'package:flutter/material.dart';
import '../auth_state.dart';
import '../app_routes.dart';

class SplashPage extends StatefulWidget {
  final AuthState authState;

  const SplashPage({
    super.key,
    required this.authState,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    debugPrint('🚀 Splash init');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final target = widget.authState.isLoggedIn
          ? AppRoutes.home
          : AppRoutes.login;

      debugPrint('🚀 Splash redirect → $target');

      Navigator.of(context).pushReplacementNamed(target);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🚀 Splash build');
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
