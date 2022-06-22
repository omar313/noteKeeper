// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


Map<String, dynamic> _$NoteDtoToJson(NoteDto instance) => <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'serverTimeStamp': instance.serverTimeStamp,
      'todos': instance.todos,
    };

TodoItemDto _$TodoItemDtoFromJson(Map<String, dynamic> json) => TodoItemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$TodoItemDtoToJson(TodoItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
    };

_$_NoteDto _$$_NoteDtoFromJson(Map<String, dynamic> json) => _$_NoteDto(
      body: json['body'] as String,
      color: json['color'] as int,
      serverTimeStamp: json['serverTimeStamp'],
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TodoItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'serverTimeStamp': instance.serverTimeStamp,
      'todos': instance.todos,
    };
