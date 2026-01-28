import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(AppStatus.unauthenticated)) {
    on<AppStarted>((event, emit) {
      debugPrint('🚀 AppStarted');
      emit(const AppState(AppStatus.unauthenticated));
    });

    on<LoggedIn>((event, emit) {
      debugPrint('✅ LoggedIn');
      emit(const AppState(AppStatus.authenticated));
    });

    on<LoggedOut>((event, emit) {
      debugPrint('🚪 LoggedOut');
      emit(const AppState(AppStatus.unauthenticated));
    });
  }
}

