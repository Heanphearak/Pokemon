import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon by phearak',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon by phearak'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
