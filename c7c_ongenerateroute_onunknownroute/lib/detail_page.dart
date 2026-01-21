import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemName;

  const DetailPage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟡 DetailPage build: $itemName');

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $itemName'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, 'Favorite $itemName');
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
