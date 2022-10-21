
import 'package:flutter/material.dart';
import 'package:parcial3_2520432018_2505472018/paginas/home.dart';

void main() {
  runApp(Employee());
}

class Employee extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

