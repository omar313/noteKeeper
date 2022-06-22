import 'package:classpay_new/domain/core/value_objects.dart';
import 'package:classpay_new/domain/notes/todo_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../domain/notes/note.dart';
import '../../domain/notes/value_objects.dart';

part 'note_dtos.freezed.dart';

part 'note_dtos.g.dart';

@JsonSerializable()
@freezed
class NoteDto with _$NoteDto {
  const NoteDto._();

  const factory NoteDto(
      {@JsonKey(ignore: true) String? id,
      required String body,
      required int color,
      required dynamic serverTimeStamp,
      required List<TodoItemDto> todos}) = _NoteDto;

  factory NoteDto.fromDomain(Note note) => NoteDto(
      id: note.uniqueId.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      serverTimeStamp: FieldValue.serverTimestamp(),
      todos: note.todos
          .getOrCrash()
          .map((todoItem) => TodoItemDto.fromDomain(todoItem))
          .asList());

  Note toDomain() => Note(
        uniqueId: UniqueId.fromUniqueString(id!),
        body: NoteBody(body),
        color: NoteColor(Color(color)),
        todos: List3(todos.map((e) => e.toDomain()).toImmutableList()),
      );

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromSnapshot(DocumentSnapshot snap) =>
      NoteDto.fromJson(snap.data() as Map<String, dynamic>)
          .copyWith(id: snap.id);
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue object) {
    return object;
  }
}

@JsonSerializable()
@freezed
class TodoItemDto with _$TodoItemDto {
  const TodoItemDto._();

  const factory TodoItemDto(
      {required String id,
      required String name,
      required bool done}) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
        id: todoItem.id.getOrCrash(),
        name: todoItem.name.getOrCrash(),
        done: todoItem.done);
  }

  TodoItem toDomain() {
    return TodoItem(
        id: UniqueId.fromUniqueString(id), name: TodoName(name), done: done);
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) {
    return _$TodoItemDtoFromJson(json);
  }
}
