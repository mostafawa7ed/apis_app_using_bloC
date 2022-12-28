import 'package:app/data/repository/character_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];
  CharactersCubit(this.characterRepository) : super(CharactersInitial());
  List<Character>? getAllCaracters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(ChractersLoaded(characters));
      this.characters = characters;
    });
    return this.characters;
  }
}
