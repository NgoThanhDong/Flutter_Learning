import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// =======================
/// APP ROOT
/// =======================
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

/// =======================
/// PAGE
/// =======================
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Level 2 – Real App Layout')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductCard();
        },
      ),
    );
  }
}

/// =======================
/// PRODUCT CARD
/// =======================
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Thumbnail(isMobile: isMobile),
              const SizedBox(width: 12),
              Expanded(
                child: ProductContent(isMobile: isMobile),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// =======================
/// THUMBNAIL (STACK BADGES)
/// =======================
class Thumbnail extends StatelessWidget {
  final bool isMobile;

  const Thumbnail({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final size = isMobile ? 90.0 : 120.0;

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

        /// SALE BADGE
        const Positioned(
          top: 4,
          left: 4,
          child: Badge(text: '-14%', color: Colors.red),
        ),

        /// OFFICIAL BADGE (NEW)
        const Positioned(
          bottom: 4,
          left: 4,
          child: Badge(text: 'OFFICIAL', color: Colors.blue),
        ),
      ],
    );
  }
}

/// =======================
/// CONTENT
/// =======================
class ProductContent extends StatelessWidget {
  final bool isMobile;

  const ProductContent({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderRow(),
        const SizedBox(height: 4),
        const RatingRow(),
        const SizedBox(height: 6),
        const Description(),
        const SizedBox(height: 10),

        /// PRICE (REUSABLE)
        const PriceSection(
          price: '₫29,990,000',
          originalPrice: '₫34,990,000',
        ),

        /// META ROW (CONDITIONAL)
        if (!isMobile) ...[
          const SizedBox(height: 8),
          const MetaRow(),
        ],
      ],
    );
  }
}

/// =======================
/// HEADER
/// =======================
class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Text(
            'Apple iPhone 15 Pro Max',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Icon(Icons.favorite_border),
      ],
    );
  }
}

/// =======================
/// RATING WITH SPREAD
/// =======================
class RatingRow extends StatelessWidget {
  const RatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    const rating = 4;

    return Row(
      children: [
        ...List.generate(
          rating,
          (index) => const Icon(Icons.star, size: 16, color: Colors.orange),
        ),
        const SizedBox(width: 6),
        const Text('4.8 | Sold 2.1k',
            style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

/// =======================
/// DESCRIPTION
/// =======================
class Description extends StatelessWidget {
  const Description({super.key});

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
/// PRICE (REUSABLE WIDGET)
/// =======================
class PriceSection extends StatelessWidget {
  final String price;
  final String originalPrice;

  const PriceSection({
    super.key,
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          price,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          originalPrice,
          style: const TextStyle(
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
class MetaRow extends StatelessWidget {
  const MetaRow({super.key});

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
class Badge extends StatelessWidget {
  final String text;
  final Color color;

  const Badge({super.key, required this.text, required this.color});

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
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }
}
