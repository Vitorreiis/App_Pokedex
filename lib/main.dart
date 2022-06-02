import 'package:app_pokedex/features/common/repositories/pokemon_repository.dart';
import 'package:app_pokedex/features/home/container/home_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'features/home/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
