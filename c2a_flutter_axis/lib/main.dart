import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AlignmentDemoPage());
  }
}

class AlignmentDemoPage extends StatelessWidget {
  const AlignmentDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Axis Alignment Demo'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                box('A'),
                box('B'),
                box('C'),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Container(
            color: Colors.grey.shade300,
            height: 300,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                box('A'),
                box('B'),
                box('C'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget box(String text) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(4),
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
