import 'package:app/data/web_services/character_web_services.dart';

import '../models/characters.dart';

class CharacterRepository {
  final CharacterWebService characterWebService;

  CharacterRepository(this.characterWebService);
  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebService.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
