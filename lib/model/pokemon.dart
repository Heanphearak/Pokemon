class Pokemon {
  final String id;
  final String name;
  final List types;
  final String imageUrl;
  bool isFavorite = false;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(dynamic data) {
    return Pokemon(
      id: data['id'],
      name: data['name'],
      types: data['typeofpokemon'],
      imageUrl: data['imageurl'],
    );
  }
}
