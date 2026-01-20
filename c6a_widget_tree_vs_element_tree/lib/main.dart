import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ROOT APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🔵 MyApp build');
    return const MaterialApp(
      home: DemoPage(),
    );
  }
}

/// PAGE (STATEFUL)
class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('🟢 DemoPage build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget vs Element'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Counter = $counter',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            // const ChildStateless(),
            ChildStateless(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

/// CHILD STATELESS
class ChildStateless extends StatelessWidget {
  const ChildStateless({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('🔴 ChildStateless build');
    return const Text(
      'I am Stateless',
      style: TextStyle(fontSize: 18),
    );
  }
}
