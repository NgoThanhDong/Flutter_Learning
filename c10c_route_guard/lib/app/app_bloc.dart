import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitializing()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    await Future.delayed(const Duration(seconds: 1));

    // Giả lập: chưa login
    emit(Unauthenticated());
  }

  void _onLoggedIn(LoggedIn event, Emitter<AppState> emit) {
    emit(Authenticated());
  }

  void _onLoggedOut(LoggedOut event, Emitter<AppState> emit) {
    emit(Unauthenticated());
  }
}
