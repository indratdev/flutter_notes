// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotesModel _$NotesModelFromJson(Map<String, dynamic> json) => NotesModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      content: json['content'] as String,
      noteColor: json['noteColor'] as String? ?? "",
      status: json['status'] as String? ?? "",
      createdTime: DateTime.parse(json['createdTime'] as String),
      modifieldTime: json['modifieldTime'] == null
          ? null
          : DateTime.parse(json['modifieldTime'] as String),
    );

Map<String, dynamic> _$NotesModelToJson(NotesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'noteColor': instance.noteColor,
      'status': instance.status,
      'createdTime': instance.createdTime.toIso8601String(),
      'modifieldTime': instance.modifieldTime?.toIso8601String(),
    };
