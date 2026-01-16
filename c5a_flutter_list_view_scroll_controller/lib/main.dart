import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ScrollControllerPage());
  }
}

class ScrollControllerPage extends StatefulWidget {
  const ScrollControllerPage({super.key});

  @override
  State<ScrollControllerPage> createState() => _ScrollControllerPageState();
}

class _ScrollControllerPageState extends State<ScrollControllerPage> {
  final ScrollController _scrollController = ScrollController();

  final List<String> items = List.generate(50, (index) => 'Item ${index + 1}');

  bool _isShowSrollTop = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // Theo dõi vị trí scroll
      if (_scrollController.offset < 100) {
        debugPrint('Top');
        setState(() {
          _isShowSrollTop = false;
        });
      } else if (_scrollController.offset > 500) {
        debugPrint('Bottom');
        setState(() {
          _isShowSrollTop = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // ⚠️ RẤT QUAN TRỌNG
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
    setState(() {
      _isShowSrollTop = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScrollController cơ bản')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(leading: Icon(Icons.star), title: Text(items[index]));
        },
      ),
      floatingActionButton: _isShowSrollTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
