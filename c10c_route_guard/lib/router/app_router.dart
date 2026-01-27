import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/app_bloc.dart';
import '../app/app_state.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';
import 'app_route_guard.dart';

class AppRouter extends StatelessWidget {
  final String location;

  const AppRouter({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        debugPrint('State: $state');
        debugPrint('Location: $location');

        final guardedLocation = AppRouteGuard.guard(
          state: state,
          location: location,
        );

        if (state is AppInitializing) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        debugPrint('Guarded location: $guardedLocation');

        switch (guardedLocation) {
          case '/login':
            return const LoginPage();
          case '/home':
            return const HomePage();
          default:
            return const LoginPage();
        }
      },
    );
  }
}
