import 'dart:async';
import 'package:flutter/foundation.dart';

/// Nhiệm vụ duy nhất:
/// Nghe Bloc stream → báo router rebuild
class GoRouterRefreshNotifier extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshNotifier(Stream stream) {
    _subscription = stream.listen((_) {
      debugPrint('🔁 AppState changed → refresh router');
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
