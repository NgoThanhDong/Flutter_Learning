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
      home: Practice53Page(),
    );
  }
}

class Practice53Page extends StatefulWidget {
  const Practice53Page({super.key});

  @override
  State<Practice53Page> createState() => _Practice53PageState();
}

class _Practice53PageState extends State<Practice53Page> {
  final ScrollController _scrollController = ScrollController();

  final List<String> _items = [];
  bool _isLoading = false;
  bool _hasMore = true;

  int _page = 0;
  final int _pageSize = 20;
  final int _maxPage = 3; // giả lập chỉ có 3 trang

  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    // ⏳ Giả lập gọi API
    await Future.delayed(const Duration(seconds: 1));

    if (_page >= _maxPage) {
      setState(() {
        _hasMore = false;
        _isLoading = false;
      });
      return;
    }

    final newItems = List.generate(
      _pageSize,
      (index) => 'Item ${(index + 1) + _page * _pageSize}',
    );

    setState(() {
      _page++;
      _items.addAll(newItems);
      _isLoading = false;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practice 5.3 - Infinite Scroll')),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ListTile(
              leading: const Icon(Icons.list),
              title: Text(_items[index]),
            );
          }

          // 🔄 Loading (chỉ khi còn trang)
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
