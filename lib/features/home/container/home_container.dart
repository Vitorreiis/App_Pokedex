import 'package:app_pokedex/features/common/error/failure.dart';
import 'package:app_pokedex/features/common/models/pokemon.dart';
import 'package:app_pokedex/features/common/repositories/pokemon_repository.dart';
import 'package:app_pokedex/features/home/pages/home_error.dart';
import 'package:app_pokedex/features/home/pages/home_loading.dart';
import 'package:app_pokedex/features/home/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(list: snapshot.data!);
          }

          if (snapshot.hasError) {
            return HomeError(
              error: (snapshot.error as Failure).message!,
            );
          }

          return Container();
        });
  }
}
