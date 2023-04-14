import 'package:marvel_app/models/character.dart';

import '../services/api_service.dart';

class CharactersRepository {
  final ApiService _apiService;

  CharactersRepository(this._apiService);

  Future<List<Character>> fetchCharacters(
      {String query = '', int offset = 0}) async {
    final response = await _apiService.fetchData(
      'characters',
      query: query,
      offset: offset,
    );

    return response['data']['results']
        .map<Character>((json) => Character.fromJson(json))
        .toList();
  }
}
