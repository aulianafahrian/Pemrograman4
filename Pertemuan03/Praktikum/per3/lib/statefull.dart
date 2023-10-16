import 'package:flutter/material.dart';

class MyStateFullState extends StatefulWidget {
  const MyStateFullState({super.key});

  @override
  State<MyStateFullState> createState() => _MyStateFullStateState();
}

class _MyStateFullStateState extends State<MyStateFullState> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Text('selamat datang di flutter class statefull')
          ),
      ),
    );
  }
}