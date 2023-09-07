import 'package:flutter/material.dart';
import 'package:pokemon_sem10/models/pokemon_model.dart';
import 'package:pokemon_sem10/ui/general/colors.dart';
import 'package:pokemon_sem10/ui/widgets/item_data_widget.dart';
import 'package:pokemon_sem10/ui/widgets/item_type_widget.dart';

class DetailPage extends StatelessWidget {
  PokemonModel pokemon;
  DetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height; //la altura de dispositivo
    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: alto * 0.1, //10%
            right: -30,
            child: Image.asset(
              "assets/img/pokeball.png",
              height: 200,
              color: Colors.white.withOpacity(0.26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min, //limita la altura al minimo
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      //tipo de pokemon ,ejem: fuego, agua
                      children: pokemon.type
                          .map((e) => ItemTypeWidget(text: e))
                          .toList(),
                    )
                  ],
                ),
                Text(
                  "#${pokemon.numPokemon}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            const Text(
                              "about pokemon",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ItemDataWidget(
                              titulo: "Alto",
                              dato: pokemon.alto,
                            ),
                            ItemDataWidget(
                              titulo: "ancho",
                              dato: "6m",
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              child: Row(
                                children: [
                                  Text("Multiplayers"),
                                  Text("1.58"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: -90,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            pokemon.img,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
