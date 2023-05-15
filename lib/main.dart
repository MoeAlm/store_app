import 'package:flutter/material.dart';
import 'package:store_app/view/detail_screen.dart';
import 'package:store_app/view/home_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
