import 'package:bloc/bloc.dart';
import 'package:bloc_breaking/data/model/characters_model.dart';
import 'package:bloc_breaking/data/repo/all_char_repo.dart';
import 'package:meta/meta.dart';

part 'charactars_state.dart';

class CharactarsCubit extends Cubit<CharactarsState> {
  final AllCharRepo _allCharRepo;
  List<CharactersModel> allcharacters = [];

  CharactarsCubit(this._allCharRepo) : super(CharactarsInitial());

  List<CharactersModel> getAllCharacters() {
    _allCharRepo.getAllCharacters().then((characters) {
      emit(CharactarsLoaded(characters: characters));
      allcharacters = characters;
    });
    return allcharacters;
  }

  // Future<void> getAllCharacters() async {
  //   try {
  //     final characters = await _allCharRepo.getAllCharacters();
  //     emit(CharactarsLoaded(characters: characters));
  //   } catch (e) {
  //     print("Error loading characters: $e");
  //   }
  // }
}
