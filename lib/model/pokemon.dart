class Pokemon {
  final String id;
  final String name;
  final List types;
  final String imageUrl;
  final String description;
  final String height;
  final String weight;
  final String category;
  final int hp;
  final int attack;
  final int defense;
  final int speed;

  bool isFavorite = false;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
    required this.description,
    required this.height,
    required this.weight,
    required this.category,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.speed,
  });

  factory Pokemon.fromJson(dynamic data) {
    return Pokemon(
      id: data['id'],
      name: data['name'],
      types: data['typeofpokemon'],
      imageUrl: data['imageurl'],
      description: data['ydescription'],
      height: data['height'],
      weight: data['weight'],
      category: data['category'],
      hp: data['hp'],
      attack: data['attack'],
      defense: data['defense'],
      speed: data['speed'],
    );
  }
}
