import 'package:flutter/material.dart';
import 'package:p6_praktek/input_form.dart';
import 'package:p6_praktek/input_validation.dart';
import 'package:p6_praktek/page.dart';

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key});

  @override
  State<MyNavigation> createState() => _MyWidgeNavigationState();
}

class _MyWidgeNavigationState extends State<MyNavigation> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const MyInput(),
    const MyInputValidation(),
    const MyInputForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Latihan Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Input Validation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input_outlined),
            label: 'Input Form',
          ), 
        ],
        backgroundColor: Colors.amber[700],
        ),
    );
  }
}