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
      home: MultiStatePage(),
    );
  }
}

class Product {
  final String title;
  bool isFavorite;

  Product({
    required this.title,
    this.isFavorite = false,
  });
}

class MultiStatePage extends StatefulWidget {
  const MultiStatePage({super.key});

  @override
  State<MultiStatePage> createState() => _MultiStatePageState();
}

class _MultiStatePageState extends State<MultiStatePage> {
  List<Product> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _items = List.generate(
      20,
      (i) => Product(title: 'Product #$i'),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 3.3')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: _items[index],
          );
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
  @override
  Widget build(BuildContext context) {
    debugPrint('build item ${widget.product.title} ${identityHashCode(this)}');
    return ListTile(
      title: Text(widget.product.title),
      trailing: IconButton(
        icon: Icon(
          widget.product.isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
          color: widget.product.isFavorite ? Colors.red : null,
        ),
        onPressed: _toggleFavorite,
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      widget.product.isFavorite =
          !widget.product.isFavorite;
    });
  }
}
