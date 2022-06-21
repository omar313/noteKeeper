import 'package:classpay_new/domain/core/value_objects.dart';
import 'package:classpay_new/domain/notes/todo_item.dart';
import 'package:classpay_new/domain/notes/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../core/failures.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note(
      {required UniqueId uniqueId,
      required NoteBody body,
      required NoteColor color,
      required List3<TodoItem> todos}) = _Note;

  factory Note.empty() => Note(
      uniqueId: UniqueId(),
      body: NoteBody(''),
      color: NoteColor(NoteColor.predefinedColors[0]),
      todos: List3(emptyList()));

  Option<ValueFailure<dynamic>> get failureOptions {
    return body.failureOrUnit
        .andThen(todos.failureOrUnit)
        .andThen(todos.getOrCrash()
        .map((todoItem) => todoItem.failureOptions)
        .filter((o) => o.isSome())
        .getOrElse(0, (p0) => none())
        .fold(() => right(unit), (f) => left(f))
    )

        .fold((l) => some(l), (r) => none());
  }
}
