import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Flutter Web', style: TextStyle(fontSize: 32)),
              SizedBox(height: 16),
              Text('Layout cơ bản'),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Flutter = ghép widget + căn chỉnh',
                  style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.web),
                  SizedBox(width: 8),
                  Text('Chạy trên Chrome'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
