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
      home: Practice54Page(),
    );
  }
}

/// =======================
/// PAGE
/// =======================
class Practice54Page extends StatefulWidget {
  const Practice54Page({super.key});

  @override
  State<Practice54Page> createState() => _Practice54PageState();
}

/// =======================
/// STATE
/// =======================
class _Practice54PageState extends State<Practice54Page> {
  /// Controller theo dõi vị trí scroll
  final ScrollController _scrollController = ScrollController();

  /// Danh sách dữ liệu
  final List<String> _items = [];

  /// Trạng thái loading
  bool _isLoading = false;

  /// Còn dữ liệu để load không
  bool _hasMore = true;

  /// Thông tin phân trang
  int _page = 0;
  final int _pageSize = 20;
  final int _maxPage = 3; // giả lập chỉ có 3 trang

  /// =======================
  /// INIT
  /// =======================
  @override
  void initState() {
    super.initState();
    _loadMore(); // load trang đầu tiên
    _scrollController.addListener(_onScroll);
  }

  /// =======================
  /// SCROLL LISTENER
  /// =======================
  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMore) {
      _loadMore();
    }
  }

  /// =======================
  /// LOAD MORE DATA
  /// =======================
  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    // Giả lập API call
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

  /// =======================
  /// PULL TO REFRESH
  /// =======================
  Future<void> _onRefresh() async {
    setState(() {
      _page = 0;
      _items.clear();
      _hasMore = true;
    });

    await _loadMore();
  }

  /// =======================
  /// CLEAN UP
  /// =======================
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// =======================
  /// UI
  /// =======================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice 5.4 - Refresh + Load More'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _onRefresh),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _items.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < _items.length) {
              return ListTile(
                leading: const Icon(Icons.list),
                title: Text(_items[index]),
              );
            }

            // Loading indicator (footer)
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
