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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProductListItem(
            name: 'Flutter Shoes',
            description: 'Lightweight running shoes',
            price: 59.99,
            rating: 4.5,
            reviewCount: 124,
            isOnSale: true,
          ),
          ProductListItem(
            name: 'Flutter Jacket',
            description: 'Waterproof outdoor jacket',
            price: 89.99,
            rating: 4.2,
            reviewCount: 86,
            isOnSale: false,
          ),
        ],
      ),
    );
  }
}

/// =======================
/// PRODUCT LIST ITEM
/// =======================
class ProductListItem extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final bool isOnSale;

  const ProductListItem({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.isOnSale,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ProductThumbnail(),
            const SizedBox(width: 12),
            Expanded(
              child: _ProductContent(
                name: name,
                description: description,
                price: price,
                rating: rating,
                reviewCount: reviewCount,
                isOnSale: isOnSale,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// LEFT IMAGE
/// =======================
class _ProductThumbnail extends StatelessWidget {
  const _ProductThumbnail();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image, size: 40),
    );
  }
}

/// =======================
/// RIGHT CONTENT
/// =======================
class _ProductContent extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final bool isOnSale;

  const _ProductContent({
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.isOnSale,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderRow(name: name),
        const SizedBox(height: 4),
        _RatingRow(rating: rating, reviewCount: reviewCount),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),

        /// 👇 CHỖ QUAN TRỌNG
        _BottomRow(
          price: price,
          isOnSale: isOnSale,
        ),
      ],
    );
  }
}

/// =======================
/// HEADER ROW
/// =======================
class _HeaderRow extends StatelessWidget {
  final String name;

  const _HeaderRow({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(Icons.favorite_border, size: 20),
      ],
    );
  }
}

/// =======================
/// RATING ROW
/// =======================
class _RatingRow extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const _RatingRow({
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, size: 16, color: Colors.orange),
        const SizedBox(width: 4),
        Text('$rating'),
        const SizedBox(width: 6),
        Text(
          '($reviewCount reviews)',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

/// =======================
/// BOTTOM ROW
/// =======================
class _BottomRow extends StatelessWidget {
  final double price;
  final bool isOnSale;

  const _BottomRow({
    required this.price,
    required this.isOnSale,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        /// 👇 CHỖ BẠN HỎI
        if (isOnSale) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'SALE',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],

        const Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Add'),
        ),
      ],
    );
  }
}
