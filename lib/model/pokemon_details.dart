class PokemonDetail {
  final List<String> abilities;
  final List<String> types;
  final int baseExperience;
  final int height;
  final int weight;

  PokemonDetail({
    required this.abilities,
    required this.types,
    required this.baseExperience,
    required this.height,
    required this.weight,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      abilities: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
      baseExperience: json['base_experience'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
