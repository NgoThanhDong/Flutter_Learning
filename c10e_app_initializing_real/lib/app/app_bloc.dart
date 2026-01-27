import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitializing()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  /// App vừa mở → kiểm tra token
  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    debugPrint('🚀 AppStarted');
    emit(AppInitializing());

    final prefs = await SharedPreferences.getInstance();
    final hasToken = prefs.getBool('token') ?? false;

    debugPrint('🔍 Check token: $hasToken');

    if (hasToken) {
      debugPrint('✅ Token found → Authenticated');
      emit(Authenticated());
    } else {
      debugPrint('❌ No token → Unauthenticated');
      emit(Unauthenticated());
    }
  }

  /// User login
  Future<void> _onLoggedIn(LoggedIn event, Emitter<AppState> emit) async {
    debugPrint('🔐 LoggedIn');

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('token', true);

    debugPrint('💾 Token saved');
    emit(Authenticated());
  }

  /// User logout
  Future<void> _onLoggedOut(LoggedOut event, Emitter<AppState> emit) async {
    debugPrint('🚪 LoggedOut');

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    debugPrint('🧹 Token removed');
    emit(Unauthenticated());
  }
}
