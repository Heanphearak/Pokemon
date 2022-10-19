import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon/model/pokemon.dart';

class APIService {
  Future<List<Pokemon>> getPokemonList() async {
    final response = await Dio().get(
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json',
    );

    return List.from(
        (jsonDecode(response.data) as List<dynamic>).map((e) => Pokemon.fromJson(e)));
  }
}
