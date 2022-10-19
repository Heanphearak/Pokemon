import 'package:bloc/bloc.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/repository/pokemon_repository.dart';
import 'package:pokemon/util/share_preference_util.dart';

class PokemonManagerCubit extends Cubit<List<Pokemon>> {
  List<Pokemon> pokemonList = [];

  PokemonManagerCubit() : super([]);

  final _pokemonRepository = PokemonRepository();

  initData() async {
    pokemonList = await _pokemonRepository.getPokemonList();
  }

  void toggleFavoriteById(String id) async {
    final pokemon = pokemonList.firstWhere((element) => element.id == id);
    pokemon.isFavorite = !pokemon.isFavorite;

    // handle local data
    if (pokemon.isFavorite) {
      await SharePreferenceUtil.saveFavoritePokemonId(id);
    } else {
      await SharePreferenceUtil.removeFavoritePokemonId(id);
    }

    // make screen re-render
    emit(pokemonList);
  }
}
