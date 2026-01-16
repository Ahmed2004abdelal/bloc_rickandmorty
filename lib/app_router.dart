import 'package:bloc_breaking/business_logic/cubit/charactars_cubit.dart';
import 'package:bloc_breaking/consts/strings.dart';
import 'package:bloc_breaking/data/model/characters_model.dart';
import 'package:bloc_breaking/data/repo/all_char_repo.dart';
import 'package:bloc_breaking/presentation/screens/charactars_screen.dart';
import 'package:bloc_breaking/presentation/screens/character_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late AllCharRepo allCharRepo;
  late CharactarsCubit charactarsCubit;

  AppRouter() {
    allCharRepo = AllCharRepo();
    charactarsCubit = CharactarsCubit(allCharRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CharactarsCubit(allCharRepo),
            child: CharactarsScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as CharactersModel ; 
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character: character,));
    }
  }
}
