import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ListView Advanced', home: ListPage());
  }
}

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<String> items = List.generate(
    20,
    (index) => 'Flutter Item ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView nâng cao')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 1);
        },
        itemBuilder: (context, index) {
          return ListItem(
            title: items[index],
            index: index,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Bạn chọn: ${items[index]}'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final int index;
  final VoidCallback onTap;

  const ListItem({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: index % 2 == 0
          ? const Icon(Icons.label)
          : const Icon(Icons.label_important_outline),
      title: Text(
        title,
        style: TextStyle(
          color: index % 2 == 0 ? Colors.purple : Colors.pink,
        ),
      ),
      subtitle: Text('Sub title ${index + 1}'),
      trailing: index % 2 == 0
          ? const Icon(Icons.arrow_forward)
          : const Icon(Icons.arrow_forward_ios_outlined),
      onTap: onTap,
    );
  }
}
