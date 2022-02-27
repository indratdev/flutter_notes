part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class ViewAllNotes extends NotesEvent {}

class AddNewNote extends NotesEvent {
  NotesModel note;

  AddNewNote({required this.note});
}

class DeleteAllNoteEvent extends NotesEvent {}

class ViewNoteEvent extends NotesEvent {
  int id;

  ViewNoteEvent({required this.id});
}

class UpdateNoteEvent extends NotesEvent {
  NotesModel note;
  int id;

  UpdateNoteEvent({required this.id, required this.note});
}

class DeleteNoteByID extends NotesEvent {
  int id;

  DeleteNoteByID({required this.id});
}
