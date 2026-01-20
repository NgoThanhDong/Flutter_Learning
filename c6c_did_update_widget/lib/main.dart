import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    Item(id: 1, name: 'Apple', isFavorite: true),
    Item(id: 2, name: 'Banana', isFavorite: false),
    Item(id: 3, name: 'Cherry', isFavorite: false),
  ];

  void _reverse() {
    setState(() {
      items = items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 DemoPage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('didUpdateWidget Demo'),
        actions: [
          IconButton(icon: const Icon(Icons.swap_vert), onPressed: _reverse),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemTile(
            // key: ValueKey(item.id),
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
  final bool isFavorite;

  Item({required this.id, required this.name, required this.isFavorite});
}

/// ❌ BUGGY VERSION
class ItemTile extends StatefulWidget {
  final Item item;

  const ItemTile({super.key, required this.item});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  late bool isFavoriteUI;

  @override
  void initState() {
    super.initState();
    isFavoriteUI = widget.item.isFavorite;
    debugPrint('🟡 initState ${widget.item.name} fav=$isFavoriteUI');
  }

  @override
  void didUpdateWidget(covariant ItemTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.item.id != widget.item.id) {
      isFavoriteUI = widget.item.isFavorite;
      debugPrint(
        '🟠 didUpdateWidget '
        '${oldWidget.item.name} → ${widget.item.name} '
        'reset favUI=$isFavoriteUI',
      );
    }
  }

  @override
  void dispose() {
    debugPrint(
      '⚫ dispose ${widget.item.name} '
      'id=${widget.item.id} '
      'hash=${widget.item.hashCode}',
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴 build ${widget.item.name} favUI=$isFavoriteUI');

    return ListTile(
      title: Text(widget.item.name),
      trailing: Icon(
        isFavoriteUI ? Icons.favorite : Icons.favorite_border,
        color: isFavoriteUI ? Colors.red : null,
      ),
    );
  }
}
