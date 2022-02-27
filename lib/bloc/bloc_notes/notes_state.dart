part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesInitial extends NotesState {}

class LoadingNotesState extends NotesState {}

class FailureNotesState extends NotesState {
  String info;

  FailureNotesState({required this.info});

  @override
  List<Object> get props => [info];
}

class LoadedNotesState extends NotesState {
  List<NotesModel> notes;

  LoadedNotesState({required this.notes});

  @override
  List<Object> get props => [notes];
}

class SuccessAddNewNote extends NotesState {
  int value;

  SuccessAddNewNote({required this.value});

  @override
  List<Object> get props => [value];
}

class SuccessDeleteAllNoteState extends NotesState {}

class FailureDeleteAllNoteState extends NotesState {
  String info;

  FailureDeleteAllNoteState({required this.info});

  @override
  List<Object> get props => [info];
}

// view note
class ViewNoteState extends NotesState {
  NotesModel note;

  ViewNoteState({required this.note});

  @override
  List<Object> get props => [note];
}

//update note
class LoadingUpdateNoteState extends NotesState {}

class FailureUpdateNoteState extends NotesState {
  String info;

  FailureUpdateNoteState({required this.info});

  @override
  List<Object> get props => [info];
}

class SuccessUpdateNoteState extends NotesState {}

// delete note by id
class LoadingDeleteNoteById extends NotesState {}

class FailureDeleteNoteById extends NotesState {
  String info;

  FailureDeleteNoteById({required this.info});

  @override
  List<Object> get props => [info];
}

class SuccessDeleteNoteById extends NotesState {}
