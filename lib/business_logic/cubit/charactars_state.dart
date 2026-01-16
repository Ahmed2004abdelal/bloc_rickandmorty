part of 'charactars_cubit.dart';

@immutable
abstract class CharactarsState {}

class CharactarsInitial extends CharactarsState {}

class CharactarsLoaded extends CharactarsState {
  final List<CharactersModel> characters;
  CharactarsLoaded({required this.characters});
}
