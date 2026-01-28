import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app_bloc.dart';
import 'app/app_state.dart';
import 'auth/login_page.dart';
import 'home/home_page.dart';
import 'user/user_bloc.dart';
import 'order/order_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        debugPrint('🔄 AppState = ${state.status}');

        if (state.status == AppStatus.unauthenticated) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // key: ValueKey('unauth'),
            home: LoginPage(),
          );
        }

        /// 🔥 CHỖ QUAN TRỌNG NHẤT CỦA BÀI HỌC 🔥
        return MultiBlocProvider(
          providers: [
            BlocProvider(lazy: false, create: (_) => UserBloc()),
            BlocProvider(lazy: false, create: (_) => OrderBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // key: ValueKey('auth'),
            home: HomePage(),
          ),
        );
      },
    );
  }
}
