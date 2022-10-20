import 'package:bloc/bloc.dart';

import '../../model/pokemon.dart';

class PokemonDetailWatcherCubit extends Cubit<bool> {
  Pokemon? pokemon;

  PokemonDetailWatcherCubit() : super(false);

  void openDetail(Pokemon pokemon) {
    this.pokemon = pokemon;
    emit(true);
  }

  void closeDetail() {
    pokemon = null;
    emit(false);
  }
}
