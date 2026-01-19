import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// =======================
/// ROOT APP
/// =======================
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

/// =======================
/// PAGE
/// =======================
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(
      10,
      (index) => Product(
        name: 'Product #$index',
        description:
            'This is a demo description for product number $index. '
            'It is intentionally long to test maxLines behavior. ${index % 2 == 0 ? 'Advanced Layout Practice!' : ''}',
        price: 20 + index.toDouble(),
        isNew: index % 3 == 0,
        isOnSale: index % 2 == 0,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Layout Practice')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductListItem(product: products[index]);
        },
      ),
    );
  }
}

/// =======================
/// DATA MODEL (UI ONLY)
/// =======================
class Product {
  final String name;
  final String description;
  final double price;
  final bool isNew;
  final bool isOnSale;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.isNew,
    required this.isOnSale,
  });
}

/// =======================
/// LIST ITEM
/// =======================
class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Thumbnail(isWide: isWide),
              const SizedBox(width: 12),
              Expanded(child: _Content(product: product)),
            ],
          ),
        ),
      ),
    );
  }
}

/// =======================
/// THUMBNAIL (RESPONSIVE)
/// =======================
class _Thumbnail extends StatelessWidget {
  final bool isWide;

  const _Thumbnail({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final size = isWide ? 100.0 : 70.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image, size: 36),
    );
  }
}

/// =======================
/// CONTENT
/// =======================
class _Content extends StatelessWidget {
  final Product product;

  const _Content({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderRow(product: product),
        const SizedBox(height: 4),
        Text(
          product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 8),
        _BottomRow(product: product),
      ],
    );
  }
}

/// =======================
/// HEADER ROW (NEW + NAME)
/// =======================
class _HeaderRow extends StatelessWidget {
  final Product product;

  const _HeaderRow({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        /// ✅ if + spread
        if (product.isNew) ...[
          const SizedBox(width: 6),
          _Badge(text: 'NEW', color: Colors.green),
        ],
      ],
    );
  }
}

/// =======================
/// BOTTOM ROW (SALE + PRICE)
/// =======================
class _BottomRow extends StatelessWidget {
  final Product product;

  const _BottomRow({required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        /// ✅ spread nâng cao (nhiều badge)
        if (product.isOnSale) ...[
          const SizedBox(width: 8),
          _Badge(text: 'SALE', color: Colors.red),
          const SizedBox(width: 4),
          _Badge(text: '-20%', color: Colors.orange),
        ],

        const Spacer(),
        const Icon(Icons.arrow_forward_ios, size: 14),
      ],
    );
  }
}

/// =======================
/// BADGE
/// =======================
class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
