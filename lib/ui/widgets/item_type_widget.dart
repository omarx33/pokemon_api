import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  String text;
  ItemTypeWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4, right: 12, top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.27),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: Offset(4, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
