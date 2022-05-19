import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/repository/pokemon_info_response.dart';
import 'package:pokedex/data/repository/pokemon_page_response.dart';
import 'package:pokedex/data/repository/pokemon_spesies_info.dart';


class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {

    final queryParameters = {
      'limit': '10',
      'offset': (pageIndex * 10).toString()
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }
  Future<PokemonInfoResponse?> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<PokemonSpeciesInfoResponse?> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
    return null;
  }
}