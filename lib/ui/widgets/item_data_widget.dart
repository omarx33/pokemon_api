import 'package:flutter/material.dart';

class ItemDataWidget extends StatelessWidget {
  String titulo;
  String dato;
  ItemDataWidget({
    required this.titulo,
    required this.dato,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$titulo: ",
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
          Text(
            "$dato: ",
          )
        ],
      ),
    );
  }
}
