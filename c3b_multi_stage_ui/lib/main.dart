import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// =======================
/// ROOT
/// =======================
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

/// =======================
/// PAGE
/// =======================
class MultiStatePage extends StatefulWidget {
  const MultiStatePage({super.key});

  @override
  State<MultiStatePage> createState() => _MultiStatePageState();
}

class _MultiStatePageState extends State<MultiStatePage> {
  bool _isLoading = false;
  bool _hasError = false;
  bool _noInternet = false; // 🔹 BÀI 3.2C
  List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    debugPrint(
      'build → loading=$_isLoading, error=$_hasError, noInternet=$_noInternet, items=${_items.length}',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Bài 3.2 – Multi State Final')),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _loadData, // 🔹 BÀI 3.2B
        child: const Icon(Icons.download),
      ),
    );
  }

  /// =======================
  /// BODY DECIDER
  /// =======================
  Widget _buildBody() {
    if (_isLoading) {
      return const _StateView(
        icon: Icons.hourglass_top,
        text: 'Loading...',
      );
    }

    if (_noInternet) {
      return _StateView(
        icon: Icons.wifi_off,
        text: 'No internet connection',
        actionText: 'Retry',
        onAction: _loadData,
      );
    }

    if (_hasError) {
      return _StateView(
        icon: Icons.error_outline,
        text: 'Something went wrong',
        actionText: 'Retry',
        onAction: _loadData,
      );
    }

    if (_items.isEmpty) {
      return const _StateView(
        icon: Icons.inbox,
        text: 'No data',
      );
    }

    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.list),
          title: Text(_items[index]),
        );
      },
    );
  }

  /// =======================
  /// ACTION
  /// =======================
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
      _noInternet = false;
      _items.clear();
    });

    await Future.delayed(const Duration(seconds: 2));

    final random = DateTime.now().second % 4;

    if (random == 0) {
      setState(() {
        _noInternet = true;
        _isLoading = false;
      });
    } else if (random == 1) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    } else if (random == 2) {
      setState(() {
        _items = [];
        _isLoading = false;
      });
    } else {
      setState(() {
        _items = List.generate(10, (i) => 'Item ${i + 1}');
        _isLoading = false;
      });
    }
  }
}

/// =======================
/// GENERIC STATE VIEW
/// =======================
class _StateView extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? actionText;
  final VoidCallback? onAction;

  const _StateView({
    required this.icon,
    required this.text,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
          if (actionText != null && onAction != null) ...[
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onAction,
              child: Text(actionText!),
            ),
          ],
        ],
      ),
    );
  }
}
