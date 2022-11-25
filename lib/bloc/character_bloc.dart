
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rick_and_morty/data/models/character.dart';
import 'package:rick_and_morty/data/repositories/character_repo.dart';

part 'character_bloc.freezed.dart';
part 'character_bloc.g.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState>
    with HydratedMixin {
  final CharacterRepo characterRepo;

  CharacterBloc({required this.characterRepo})
      : super(const CharacterStateLoading()) {
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterStateLoading());
      try {
        Character _characterLoaded = await characterRepo
            .getCharacter(event.page, event.name)
            .timeout(const Duration(seconds: 5));
        emit(CharacterStateLoaded(character: _characterLoaded));
      } catch (_) {
        emit(const CharacterStateError());
        rethrow;
      }
    });
  }

  @override
  CharacterState? fromJson(Map<String, dynamic> json) =>
      CharacterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CharacterState state) => state.toJson();
}