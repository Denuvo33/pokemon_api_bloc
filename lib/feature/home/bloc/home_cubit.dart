import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_api_bloc/model/pokemon_list_model.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<List<PokemonListModel>> {
  HomeCubit() : super([]);

  void fetchPokemonList() async {
    try {
      final response = await http.get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<PokemonListModel> pokemons = (data['results'] as List)
            .map((e) => PokemonListModel.fromJson(e))
            .toList();
        emit(pokemons);
      } else {
        throw Exception('Failed to load pokemons');
      }
    } catch (e) {
      print(e);
    }
  }
}
