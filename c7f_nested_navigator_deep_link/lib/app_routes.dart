import 'package:flutter/material.dart';

class AppRoutePath {
  final int tabIndex;
  final int? homeDetailId;
  final bool profileEdit;

  const AppRoutePath({
    required this.tabIndex,
    this.homeDetailId,
    this.profileEdit = false,
  });

  /// /home
  factory AppRoutePath.home() {
    return const AppRoutePath(tabIndex: 0);
  }

  /// /home/detail/42
  factory AppRoutePath.homeDetail(int id) {
    return AppRoutePath(
      tabIndex: 0,
      homeDetailId: id,
    );
  }

  /// /profile
  factory AppRoutePath.profile() {
    return const AppRoutePath(tabIndex: 1);
  }

  /// /profile/edit
  factory AppRoutePath.profileEdit() {
    return const AppRoutePath(
      tabIndex: 1,
      profileEdit: true,
    );
  }
}

/// Parse String route thành AppRoutePath
AppRoutePath parseRoute(String? name) {
  debugPrint('🔍 parseRoute: $name');

  if (name == null || name == '/' || name == '/home') {
    return AppRoutePath.home();
  }

  if (name.startsWith('/home/detail/')) {
    final id = int.tryParse(name.split('/').last);
    if (id != null) {
      return AppRoutePath.homeDetail(id);
    }
  }

  if (name == '/profile') {
    return AppRoutePath.profile();
  }

  if (name == '/profile/edit') {
    return AppRoutePath.profileEdit();
  }

  /// fallback an toàn
  return AppRoutePath.home();
}
