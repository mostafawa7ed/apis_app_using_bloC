part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class ChractersLoaded extends CharactersState {
  final List<Character> characters;
  ChractersLoaded(this.characters);
}

//class CharactersErrorData extends CharactersState {}
