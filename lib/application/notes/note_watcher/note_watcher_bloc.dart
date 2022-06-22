import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:classpay_new/domain/notes/i_note_repository.dart';
import 'package:classpay_new/domain/notes/note_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:meta/meta.dart';

import '../../../domain/notes/note.dart';

part 'note_watcher_event.dart';

part 'note_watcher_state.dart';

part 'note_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;
   StreamSubscription<Either<NoteFailure, KtList<Note>>>?
      _noteStreamSubscription;

  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial()) {
    on<NoteWatcherEvent>((event, emit) async {
      await event.when(
          watchAllStarted: () async {
            emit(const NoteWatcherState.loadInProgress());
            await _noteStreamSubscription?.cancel();
            _noteStreamSubscription =
                _noteRepository.watchAll().listen((failureOrNotes) {
              add(NoteWatcherEvent.notesReceived(failureOrNotes));
            });
          },
          watchUncompletedStarted: () async{
            emit(const NoteWatcherState.loadInProgress());
            await _noteStreamSubscription?.cancel();
            _noteStreamSubscription =
                _noteRepository.watchUncompleted().listen((failureOrNotes) {
                  add(NoteWatcherEvent.notesReceived(failureOrNotes));
                });
          },
          notesReceived:
              (Either<NoteFailure, KtList<Note>> failureOrNotes) async {
            emit(failureOrNotes.fold((f) => NoteWatcherState.loadFailure(f),
                (r) => NoteWatcherState.loadSuccess(r)));
          });
    });
  }

  @override
  Future<void> close() async{
   await  _noteStreamSubscription?.cancel();
    return super.close();
  }
}
