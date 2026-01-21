import 'package:flutter/material.dart';

void main() {
  debugPrint('🚀 App started');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 MyApp build');
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<Item> items = [
    Item(id: 1, name: 'Apple'),
    Item(id: 2, name: 'Banana'),
    Item(id: 3, name: 'Cherry'),
  ];

  void _reverse() {
    debugPrint('🔵 Reverse list');
    setState(() {
      items = items.reversed.toList();
    });
  }

  void _toggleFavorite(Item item) {
    debugPrint('❤️ Toggle favorite: ${item.name}');
    setState(() {
      item.isFavorite = !item.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 DemoPage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebuild vs Repaint Demo'),
        actions: [
          IconButton(icon: const Icon(Icons.swap_vert), onPressed: _reverse),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemTile(
            key: ValueKey(item.id),
            item: item,
            onFavoriteToggle: () => _toggleFavorite(item),
          );
        },
      ),
    );
  }
}

class Item {
  final int id;
  final String name;
  bool isFavorite;

  Item({required this.id, required this.name, this.isFavorite = false});
}

class ItemTile extends StatelessWidget {
  final Item item;
  final VoidCallback onFavoriteToggle;

  const ItemTile({
    super.key,
    required this.item,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴 ItemTile build: ${item.name}, fav=${item.isFavorite}');

    return ListTile(
      leading: Icon(
        item.isFavorite ? Icons.label : Icons.label_outline,
        color: item.isFavorite ? Colors.red[600] : null,
      ),
      title: Text(item.name),
      trailing: IconButton(
        icon: Icon(
          item.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: item.isFavorite ? Colors.red : null,
        ),
        onPressed: onFavoriteToggle,
      ),
    );
  }
}
