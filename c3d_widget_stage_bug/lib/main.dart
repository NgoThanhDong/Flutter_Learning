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
      home: BugDemoPage(),
    );
  }
}

class Product {
  final String title;
  final bool isFavorite;

  Product({
    required this.title,
    required this.isFavorite,
  });
}

class BugDemoPage extends StatefulWidget {
  const BugDemoPage({super.key});

  @override
  State<BugDemoPage> createState() => _BugDemoPageState();
}

class _BugDemoPageState extends State<BugDemoPage> {
  List<Product> _items = [];

  @override
  void initState() {
    super.initState();
    _loadDataA();
  }

  void _loadDataA() {
    setState(() {
      _items = List.generate(
        5,
        (i) => Product(
          title: 'Product A$i',
          isFavorite: i.isEven,
        ),
      );
    });
  }

  void _loadDataB() {
    setState(() {
      _items = List.generate(
        5,
        (i) => Product(
          title: 'Product B$i',
          isFavorite: i.isOdd,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('didUpdateWidget BUG demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDataB,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ProductItem(product: _items[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    debugPrint('initState ${widget.product.title}');
    isFavorite = widget.product.isFavorite;
  }

  @override
  void didUpdateWidget(covariant ProductItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.product != widget.product) {
      debugPrint(
        'didUpdateWidget ${oldWidget.product.title} → ${widget.product.title}',
      );
      isFavorite = widget.product.isFavorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build ${widget.product.title}');
    return ListTile(
      title: Text(widget.product.title),
      trailing: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
    );
  }
}
