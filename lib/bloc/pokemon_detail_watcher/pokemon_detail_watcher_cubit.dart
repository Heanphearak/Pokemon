import 'package:bloc/bloc.dart';

import '../../model/pokemon.dart';

class PokemonDetailWatcherCubit extends Cubit<bool> {
  Pokemon? pokemon;
  bool isOpen = false;

  PokemonDetailWatcherCubit() : super(false);

  void openDetail(Pokemon pokemon) {
    this.pokemon = pokemon;
    isOpen = true;
    emit(isOpen);
  }

  void closeDetail() {
    pokemon = null;
    isOpen = false;
    emit(isOpen);
  }
}
