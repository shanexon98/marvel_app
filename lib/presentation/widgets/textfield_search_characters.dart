import 'package:flutter/material.dart';

import '../views/character_list.dart';

class TextFieldSearchCharacters extends StatelessWidget {
  const TextFieldSearchCharacters({
    super.key,
    required this.widget,
  });

  final CharactersList widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 75, 75, 75).withOpacity(0.4),
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          hintText: 'Buscar...',
          focusColor: Colors.white,
          hintStyle: const TextStyle(
              fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) => widget.charactersController
            .fetchCharacters(query: value, reset: true),
      ),
    );
  }
}
