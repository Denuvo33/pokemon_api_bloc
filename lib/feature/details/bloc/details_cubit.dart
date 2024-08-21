import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokemon_api_bloc/model/pokemon_details.dart';

class DetailsCubit extends Cubit<PokemonDetail?> {
  DetailsCubit() : super(null);

  void fetchPokemonDetail(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final pokemonDetail = PokemonDetail.fromJson(data);
        emit(pokemonDetail);
      } else {
        throw Exception('Failed to load Pokémon details');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
