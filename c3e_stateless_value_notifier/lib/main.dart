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
      home: ProductListPage(),
    );
  }
}

// =======================
// MODEL
// =======================
class Product {
  final String id;
  final String title;
  final ValueNotifier<bool> isFavorite;

  Product({
    required this.id,
    required this.title,
    bool favorite = false,
  }) : isFavorite = ValueNotifier(favorite);
}

// =======================
// PAGE
// =======================
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    _products = List.generate(
      20,
      (i) => Product(
        id: '$i',
        title: 'Product #$i',
        favorite: i.isEven,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 3.4 – Production List'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: _products[index],
          );
        },
      ),
    );
  }
}

// =======================
// ITEM
// =======================
class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      trailing: ValueListenableBuilder<bool>(
        valueListenable: product.isFavorite,
        builder: (context, isFav, _) {
          debugPrint('rebuild ${product.title}');
          return IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : null,
            ),
            onPressed: () {
              product.isFavorite.value = !isFav;
            },
          );
        },
      ),
    );
  }
}
