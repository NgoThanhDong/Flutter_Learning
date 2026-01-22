import 'package:flutter/material.dart';
import '../auth_state.dart';

class SplashPage extends StatefulWidget {
  final AuthState authState;

  const SplashPage({super.key, required this.authState});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    debugPrint('🚀 SplashPage init');

    Future.microtask(() {
      if (!mounted) return;

      final target =
          widget.authState.isLoggedIn ? '/home' : '/login';

      debugPrint('🚀 Splash redirect → $target');

      Navigator.of(context).pushNamedAndRemoveUntil(target, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🚀 SplashPage build');

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
