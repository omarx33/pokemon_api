class PokemonModel {
  String name;
  String img;
  List<String> type;
  String numPokemon;
  String alto;
  String multipliers;
  PokemonModel({
    required this.name,
    required this.img,
    required this.type,
    required this.numPokemon,
    required this.alto,
    required this.multipliers,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> miJson) => PokemonModel(
        name: miJson["name"],
        img: miJson["img"],
        type: List<String>.from(miJson["type"]
            .map((e) => e)), //convierte una lista dinamica a lista strings
        numPokemon: miJson["num"],
        alto: miJson["height"],
        multipliers:
            List<String>.from(miJson["multipliers"].map((e) => e)).toString(),
      );
}
