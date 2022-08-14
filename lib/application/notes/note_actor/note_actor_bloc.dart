import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classpay_new/domain/notes/i_note_repository.dart';
import 'package:classpay_new/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/notes/note.dart';

part 'note_actor_bloc.freezed.dart';

part 'note_actor_event.dart';

part 'note_actor_state.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository repository;

  NoteActorBloc(this.repository) : super(const NoteActorState.initial()) {
    on<NoteActorEvent>((event, emit) async {
      emit(const NoteActorState.actionInProgress());
      final possibleFailure = await repository.delete(event.note);
      emit(possibleFailure.fold((l) => NoteActorState.deleteFailure(l),
          (r) => const NoteActorState.deleteSuccess()));
    });
  }
}
