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
      home: RealWorldProductPage(),
    );
  }
}

/// =======================
/// PAGE
/// =======================
class RealWorldProductPage extends StatelessWidget {
  const RealWorldProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopee / Amazon Layout')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const RealProductCard();
        },
      ),
    );
  }
}

/// =======================
/// PRODUCT CARD
/// =======================
class RealProductCard extends StatelessWidget {
  const RealProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Thumbnail(isWide: isWide),
              const SizedBox(width: 12),
              const Expanded(child: _Content()),
            ],
          ),
        ),
      ),
    );
  }
}

/// =======================
/// THUMBNAIL
/// =======================
class _Thumbnail extends StatelessWidget {
  final bool isWide;

  const _Thumbnail({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final size = isWide ? 120.0 : 90.0;

    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.phone_iphone, size: 40),
        ),

        /// SALE BADGE (Stack bắt đầu xuất hiện)
        Positioned(
          top: 4,
          left: 4,
          child: _Badge(
            text: '-14%',
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

/// =======================
/// CONTENT
/// =======================
class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _HeaderRow(),
        SizedBox(height: 4),
        _RatingRow(),
        SizedBox(height: 6),
        _Description(),
        SizedBox(height: 10),
        _PriceSection(),
        SizedBox(height: 8),
        _MetaRow(),
      ],
    );
  }
}

/// =======================
/// HEADER ROW
/// =======================
class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Text(
            'Apple iPhone 15 Pro Max Vip Utra Mega Tera Tara Haha',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Icon(Icons.favorite_border),
      ],
    );
  }
}

/// =======================
/// RATING ROW
/// =======================
class _RatingRow extends StatelessWidget {
  const _RatingRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.star, size: 16, color: Colors.orange),
        SizedBox(width: 4),
        Text('4.8'),
        SizedBox(width: 6),
        Text('| Sold 2.1k', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

/// =======================
/// DESCRIPTION
/// =======================
class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Titanium body, A17 chip, camera improved with better low-light performance.',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey),
    );
  }
}

/// =======================
/// PRICE SECTION
/// =======================
class _PriceSection extends StatelessWidget {
  const _PriceSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '₫29,990,000',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 2),
        Text(
          '₫34,990,000',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

/// =======================
/// META ROW
/// =======================
class _MetaRow extends StatelessWidget {
  const _MetaRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.local_shipping, size: 16, color: Colors.green),
        SizedBox(width: 4),
        Text('Free shipping'),
        SizedBox(width: 12),
        Icon(Icons.flash_on, size: 16, color: Colors.orange),
        SizedBox(width: 4),
        Text('Fast delivery'),
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

  const _Badge({
    required this.text,
    required this.color,
  });

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
