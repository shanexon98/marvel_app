import 'dart:async';
import 'package:flutter/material.dart';

import 'package:marvel_app/controllers/characters_controller.dart';
import 'package:marvel_app/presentation/widgets/text_default_widget.dart';

import '../../utlis/assets_util.dart';
import '../widgets/animation_text_welcome.dart';
import '../widgets/characters_list_results.dart';
import '../widgets/textfield_search_characters.dart';

class CharactersList extends StatefulWidget {
  final CharactersController charactersController;

  const CharactersList({super.key, required this.charactersController});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  bool isLoading = false;
  void _startLoading() {
    setState(() {
      isLoading = true;
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  initState() {
    super.initState();
    widget.charactersController.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logohome.png',
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const AnimationTextWelcome(),
              const SizedBox(
                height: 20,
              ),
              TextFieldSearchCharacters(widget: widget),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  widget.charactersController.loadMore();
                  _startLoading();
                },
                child: isLoading
                    ? const SizedBox()
                    : Container(
                        alignment: Alignment.bottomRight,
                        child: const TextDefault(
                          sizeText: 20,
                          colorText: Colors.white,
                          text: 'Ver más',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              CharactersListResults(widget: widget),
              Center(
                child: isLoading
                    ? Image.asset(
                        Assets.loadingSpinner,
                        width: 50,
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
