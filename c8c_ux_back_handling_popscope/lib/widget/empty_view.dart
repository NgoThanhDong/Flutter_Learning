import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Chưa có sản phẩm nào',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
