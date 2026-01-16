import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ListView Demo', home: ListPage());
  }
}

class ListPage extends StatelessWidget {
  final List<String> items = List.generate(
    20,
    (index) => 'Flutter Web ${index + 1}',
  );

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView cơ bản')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.label),
            title: Text(items[index]),
            subtitle: Text('Index: $index'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Bấm vào ${items[index]}');
            },
          );
        },
      ),
    );
  }
}
