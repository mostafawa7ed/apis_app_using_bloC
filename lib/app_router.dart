import 'package:app/buisnesslogiclayer/cubit/characters_cubit.dart';
import 'package:app/data/repository/character_repository.dart';
import 'package:app/data/web_services/character_web_services.dart';
import 'package:app/persentation_layer/screens/character_details_screen.dart';
import 'package:app/persentation_layer/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/Strings.dart';
import 'data/models/characters.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebService());
    charactersCubit = CharactersCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => charactersCubit,
                  child: ChatactersScreen(),
                ));
      case characterDetials:
        final character = settings.arguments as Character; //
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character));
    }
  }
}
