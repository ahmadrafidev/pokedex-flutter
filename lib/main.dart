import 'package:flutter/material.dart';
import 'package:pokedex/modules/screens/DetailScreen.dart';
import 'package:pokedex/modules/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/detail_screen': (ctx) => const DetailScreen(),
      },
    );
  }
}

