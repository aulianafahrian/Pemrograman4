import 'package:flutter/material.dart';
import 'package:p4_2_1214049/material_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Tugas Pertemuan 4 Aufea 1214049',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}