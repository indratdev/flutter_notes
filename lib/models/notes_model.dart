import 'package:json_annotation/json_annotation.dart';

part 'notes_model.g.dart';

final String tableNotes = 'th_notes';

@JsonSerializable()
class NotesModel {
  int? id;
  String title, content, noteColor, status;
  DateTime createdTime;
  DateTime? modifieldTime;

  NotesModel({
    this.id,
    required this.title,
    required this.content,
    this.noteColor = "",
    this.status = "",
    required this.createdTime,
    this.modifieldTime,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotesModelToJson(this);
}
