import 'package:flutter/material.dart';
import 'package:pokemon_sem10/models/pokemon_model.dart';
import 'package:pokemon_sem10/pages/detail_page.dart';
import 'package:pokemon_sem10/ui/general/colors.dart';
import 'package:pokemon_sem10/ui/widgets/item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
  // String name;
  // String image;
  // List<String> types;
  PokemonModel pokemon;

  ItemPokemonWidget({
    // required this.name,
    // required this.image,
    // required this.types,
    required this.pokemon,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      pokemon: pokemon,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorsPokemon[pokemon.type.first], //color de fondo x pokemon
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              right: -20,
              child: Image.asset(
                "assets/img/pokeball.png",
                height: 120,
                color: Colors.white.withOpacity(0.27),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Column(
                  //   children: types.map((e) => ItemTypeWidget()).toList(),
                  // )
                  ...pokemon.type
                      .map((e) => ItemTypeWidget(
                            text: e,
                          ))
                      .toList(), //recorrera los detalles si tiene 1 o 2 y le manda el valor, con ItemTypeWidget cuenta cuantos detalles tiene
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(
                pokemon.img,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
