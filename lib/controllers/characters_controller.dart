import 'package:get/get.dart';

import '../../domain/repositories/character_repository.dart';
import '../models/character.dart';

class CharactersController extends GetxController {
  late final CharactersRepository charactersRepository;
  final characters = <Character>[].obs;
  String _query = '';
  int _offset = 0;
  final _initialCharacters = <Character>[].obs;

  CharactersController({required this.charactersRepository});

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  Future<void> fetchCharacters({String query = '', bool reset = false}) async {
    if (reset || query.isNotEmpty) {
      _offset = 0;
      characters.clear();
    }
    try {
      _query = query;
      final newCharacters = await charactersRepository.fetchCharacters(
          query: _query, offset: _offset);
      if (query.isEmpty && _initialCharacters.isEmpty) {
        _initialCharacters.assignAll(newCharacters);
      }
      characters.addAll(newCharacters);

      _offset += newCharacters.length;
    } catch (e) {
      print('Error fetching characters: $e');
    }
  }

  Future<void> loadMore() async {
    await fetchCharacters(query: _query);
  }
}
