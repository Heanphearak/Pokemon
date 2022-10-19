import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtil {
  static const _KEY_FAVORITE_ID_LIST = 'FAVORITE_ID_LIST';

  static Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  static Future<void> saveFavoritePokemonId(String id) async {
    final prefs = await _getInstance();
    var currentIdList = await getFavoritePokemonIdList();
    if (!currentIdList.contains(id)) currentIdList.add(id);

    prefs.setStringList(_KEY_FAVORITE_ID_LIST, currentIdList);
  }

  static Future<void> removeFavoritePokemonId(String id) async {
    final prefs = await _getInstance();
    var currentIdList = await getFavoritePokemonIdList();

    currentIdList.removeWhere((pokemonId) => pokemonId == id);

    prefs.setStringList(_KEY_FAVORITE_ID_LIST, currentIdList);
  }

  static Future<List<String>> getFavoritePokemonIdList() async {
    final prefs = await _getInstance();
    return prefs.getStringList(_KEY_FAVORITE_ID_LIST) ?? [];
  }
}
