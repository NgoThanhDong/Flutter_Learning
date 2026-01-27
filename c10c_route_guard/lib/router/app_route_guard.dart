import '../app/app_state.dart';

class AppRouteGuard {
  static String guard({
    required AppState state,
    required String location,
  }) {
    // Chưa login
    if (state is Unauthenticated) {
      if (location == '/home') {
        return '/login';
      }
    }

    // Đã login
    if (state is Authenticated) {
      if (location == '/login') {
        return '/home';
      }
    }

    // Được phép đi
    return location;
  }
}
