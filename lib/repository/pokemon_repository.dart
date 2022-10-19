import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/service/api_service.dart';
import 'package:pokemon/util/share_preference_util.dart';

class PokemonRepository {
  final _apiService = APIService();

  Future<List<Pokemon>> getPokemonList() async {
    final list = await _apiService.getPokemonList();
    final favoriteIdList = await SharePreferenceUtil.getFavoritePokemonIdList();
    for (final pokemon in list) {
      if (favoriteIdList.contains(pokemon.id)) pokemon.isFavorite = true;
    }

    return list;
  }
}
