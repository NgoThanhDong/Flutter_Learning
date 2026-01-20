import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

  void _shuffle() {
    setState(() {
      items = items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 DemoPage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keys Bug Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: _shuffle,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemTile(
            // key: ObjectKey(item),
            key: ValueKey(item.id),
            item: item,
          );
        },
      ),
    );
  }
}

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}

/// ❌ ITEM TILE (BUG)
class ItemTile extends StatefulWidget {
  final Item item;

  const ItemTile({
    super.key,
    required this.item,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    debugPrint('🟡 initState ${widget.item.name}');
  }

  @override
  void dispose() {
    debugPrint('⚫ dispose ${widget.item.name}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴 build ${widget.item.name}');

    return ListTile(
      title: Text(widget.item.name),
      trailing: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : null,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
