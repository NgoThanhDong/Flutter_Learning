import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ===============================
/// APP ROOT
/// ===============================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(),
    );
  }
}

/// ===============================
/// PRODUCT PAGE (STATE OWNER)
/// ===============================
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final List<Product> products;

  @override
  void initState() {
    super.initState();
    products = List.generate(
      10,
      (index) => Product(
        name: 'Product $index',
        isFavorite: ValueNotifier(false),
      ),
    );
  }

  @override
  void dispose() {
    for (final product in products) {
      product.isFavorite.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 3.5 – Chuẩn Production')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

/// ===============================
/// PRODUCT MODEL
/// ===============================
class Product {
  final String name;
  final ValueNotifier<bool> isFavorite;

  Product({
    required this.name,
    required this.isFavorite,
  });
}

/// ===============================
/// PRODUCT ITEM
/// ===============================
class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    debugPrint('build ${product.name}');

    return ListTile(
      title: Text(product.name),
      trailing: ValueListenableBuilder<bool>(
        valueListenable: product.isFavorite,
        builder: (_, isFav, __) {
          return IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.grey,
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
