import '../../models/character.dart';

abstract class CharacterRepositoryInterface {
  Future<List<Character>> fetchCharacters({String? query});
}
