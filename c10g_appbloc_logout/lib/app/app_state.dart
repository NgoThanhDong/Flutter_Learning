enum AppStatus {
  unauthenticated,
  authenticated,
}

class AppState {
  final AppStatus status;

  const AppState(this.status);
}
