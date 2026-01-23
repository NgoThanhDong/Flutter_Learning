import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();

    return AbsorbPointer(
      absorbing: true, // ❌ chặn toàn bộ interaction
      child: Container(
        color: Colors.black.withValues(alpha: 0.3), // kính mờ
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
