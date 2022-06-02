import 'dart:convert';

import 'package:app_pokedex/features/common/consts/api_consts.dart';
import 'package:app_pokedex/features/common/error/failure.dart';
import 'package:app_pokedex/features/common/models/pokemon.dart';
import 'package:dio/dio.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<Map<String, dynamic>>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure("Erro ao carregar os dados");
    }
  }
}
