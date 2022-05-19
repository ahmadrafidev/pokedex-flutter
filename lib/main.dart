import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/modules/screens/navigator.dart';
import 'bloc/navigation.dart';
import 'bloc/pokemon_bloc.dart';
import 'bloc/pokemon_detail.dart';
import 'bloc/pokemon_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0))),
            BlocProvider(
                create: (context) =>
                    NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
            BlocProvider(create: (context) => pokemonDetailsCubit)
          ], child: const AppNavigator()),
    );
  }
}

