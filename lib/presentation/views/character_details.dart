import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_app/models/character.dart';

import '../widgets/detail_character.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Home.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  DetailsCharacter(character: character),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 75, 75, 75)
                                  .withOpacity(0.4),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        'assets/images/logohome.png',
                        width: 100,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
