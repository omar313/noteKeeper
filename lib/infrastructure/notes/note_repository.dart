import 'package:classpay_new/domain/notes/i_note_repository.dart';
import 'package:classpay_new/domain/notes/note.dart';
import 'package:classpay_new/domain/notes/note_failure.dart';
import 'package:classpay_new/infrastructure/core/firestore_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/src/collection/kt_list.dart';

class NoteRepository extends INoteRepository {
  final FirebaseFirestore _fireStore;

  NoteRepository(this._fireStore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    final userDoc = await _fireStore.userDocument();
   yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map((event) => null)
   ;
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() {
    // TODO: implement watchUncompleted
    throw UnimplementedError();
  }
}
