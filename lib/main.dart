import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const List<String> _list = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  'a',
  'b',
  'c',
  'd',
  'e',
  'f'
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _color = Colors.green;

  @override
  void initState() {
    _color = generate();
    super.initState();
  }

  Color generate() {
    var code = '';
    for (int i = 0; i < 6; i++) {
      final randomNumber = Random().nextInt(_list.length);
      code += _list[randomNumber];
    }
    final codeInt = int.parse('0xff$code');

    return Color(codeInt);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(() {
              _color = generate();
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: _color,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Hey there',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
