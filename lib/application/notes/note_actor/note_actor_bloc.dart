import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'note_actor_bloc.freezed.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  NoteActorBloc() : super(const NoteActorState.initial()) {
    on<NoteActorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
