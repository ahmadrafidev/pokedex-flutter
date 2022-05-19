import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/modules/screens/DetailScreen.dart';
import 'package:pokedex/modules/screens/HomeScreen.dart';
import 'bloc/pokemon_bloc.dart';
import 'bloc/pokemon_event.dart';

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
      home: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)))
          ], child: const HomeScreen()),
      initialRoute: '/',
      routes: {
        '/detail_screen': (ctx) => const DetailScreen(),
      },
    );
  }
}

