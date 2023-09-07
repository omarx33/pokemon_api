import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_sem10/models/pokemon_model.dart';
import 'package:pokemon_sem10/ui/widgets/item_pokemon_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  List<PokemonModel> pokemonsModel = [];

  initState() {
    super.initState();
    getDataPokemon();
  }

  getDataPokemon() async {
    Uri _uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> miMapa = json.decode(response.body);
      // pokemons = miMapa["pokemon"];
      pokemonsModel = miMapa["pokemon"]
          .map<PokemonModel>((item) => PokemonModel.fromJson(item))
          .toList(); //item es el valor de cada json {}
      // print(pokemonsModel);
      setState(() {});
      // pokemons.forEach((element) {
      //   print(element["type"]);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pokedex",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GridView.count(
                  //tiene scroll tbm
                  shrinkWrap: true, //limita el alto
                  physics:
                      const ScrollPhysics(), //physics controlan el scroll de GridView
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.35,
                  children: pokemonsModel
                      .map(
                        (e) => ItemPokemonWidget(
                          // name: e.name,
                          // image: e.img,
                          // types: e
                          //     .type, //genera una lista string con type, itera con map
                          pokemon: e,
                        ),
                      )
                      .toList(), //al poner toList remplaza []
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
