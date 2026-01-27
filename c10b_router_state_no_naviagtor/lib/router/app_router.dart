import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/app_bloc.dart';
import '../app/app_state.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppInitializing) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is Unauthenticated) {
          return const LoginPage();
        }

        if (state is Authenticated) {
          return const HomePage();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
