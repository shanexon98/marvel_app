import 'package:flutter/material.dart';
import 'package:marvel_app/presentation/widgets/text_default_widget.dart';

import '../../models/character.dart';

class DetailsCharacter extends StatelessWidget {
  const DetailsCharacter({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: character.id,
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(character.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextDefault(
                  sizeText: 50,
                  colorText: Colors.white,
                  text: character.name,
                  overflow: TextOverflow.fade,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextDefault(
                sizeText: 20,
                colorText: Colors.white,
                overflow: TextOverflow.fade,
                text: character.description.isNotEmpty
                    ? character.description
                    : 'El personaje no tiene descripción. Esperala pronto. ',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 16),
              const TextDefault(
                sizeText: 30,
                colorText: Colors.white,
                text: 'Comics:',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 0, 0),
                  border: Border.all(color: Colors.red, width: 1),
                ),
              ),
              const SizedBox(height: 8),
              ...character.comics
                  .map(
                    (comic) => TextDefault(
                      sizeText: 18,
                      overflow: TextOverflow.fade,
                      colorText: Colors.white,
                      text: comic.isNotEmpty
                          ? comic
                          : 'El personaje no tiene Comics. Esperalos pronto.',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  .toList(),
              const SizedBox(height: 16),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 0, 0),
                  border: Border.all(color: Colors.red, width: 1),
                ),
              ),
              const SizedBox(height: 16),
              const TextDefault(
                sizeText: 30,
                colorText: Colors.white,
                text: 'Series:',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              ...character.series
                  .map(
                    (serie) => TextDefault(
                      sizeText: 18,
                      overflow: TextOverflow.fade,
                      colorText: Colors.white,
                      text: serie.isNotEmpty
                          ? serie
                          : 'El personaje no tiene series. Esperalas pronto. ',
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  .toList(),
              const SizedBox(height: 8),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 0, 0),
                  border: Border.all(color: Colors.red, width: 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
