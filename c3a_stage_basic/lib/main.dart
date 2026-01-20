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
      home: CounterPage(),
    );
  }
}

/// =======================
/// STATEFUL PAGE
/// =======================
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('👉 build() called, count = $_count');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 3.1 – setState nâng cao'),
      ),
      body: Center(
        child: Text(
          'Count: $_count',
          style: TextStyle(
            fontSize: 32,
            color: _count > 5 ? Colors.red : Colors.black,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: _increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'reset',
            backgroundColor: Colors.grey,
            onPressed: _reset,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }

  /// =======================
  /// ACTIONS
  /// =======================
  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }
}
