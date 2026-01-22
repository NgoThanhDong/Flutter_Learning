import 'package:flutter/material.dart';
import 'home_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🏠 HomePage build');

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('Item $index'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => HomeDetailPage(id: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
