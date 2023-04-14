import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/character_details.dart';
import '../views/character_list.dart';

class CharactersListResults extends StatelessWidget {
  const CharactersListResults({
    super.key,
    required this.widget,
  });

  final CharactersList widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final characters = widget.charactersController.characters;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: characters.length,
          itemBuilder: (BuildContext context, int index) {
            final character = characters[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => CharacterDetails(character: character));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(character.imageUrl),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(
                            0, 3), // Cambia la posición de la sombra
                      ),
                    ],
                    color: const Color(0xff202020),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
