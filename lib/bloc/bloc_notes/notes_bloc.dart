import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_notes/database/sql_database.dart';
import 'package:flutter_notes/models/notes_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(NotesInitial()) {
    final dbprovider = SqlDatabase.instance;

    on<ViewAllNotes>((event, emit) async {
      try {
        emit(LoadingNotesState());
        final result = await dbprovider.readAllNotes();

        emit(LoadedNotesState(notes: result));
      } catch (e) {
        emit(FailureNotesState(info: e.toString()));
      }
    });

    // add new note
    on<AddNewNote>((event, emit) async {
      try {
        emit(LoadingNotesState());
        final result = await dbprovider.insertNote(event.note);
        emit(SuccessAddNewNote(value: result));
      } catch (e) {
        emit(FailureNotesState(info: e.toString()));
      }
    });

    // delete all note
    on<DeleteAllNoteEvent>((event, emit) async {
      try {
        emit(LoadingNotesState());
        await dbprovider.deleteTableNotes();
        emit(SuccessDeleteAllNoteState());
      } catch (e) {
        emit(FailureDeleteAllNoteState(info: e.toString()));
      }
    });

    // view note
    on<ViewNoteEvent>((event, emit) async {
      try {
        emit(LoadingNotesState());
        final result = await dbprovider.readNoteByID(event.id);
        emit(ViewNoteState(note: result!));
      } catch (e) {
        emit(FailureNotesState(info: e.toString()));
      }
    });

    // update note
    on<UpdateNoteEvent>((event, emit) {
      try {
        emit(LoadingUpdateNoteState());
        final result = dbprovider.updateNote(event.id, event.note);
        emit(SuccessUpdateNoteState());
      } catch (e) {
        emit(FailureUpdateNoteState(info: e.toString()));
      }
    });

    on<DeleteNoteByID>((event, emit) {
      try {
        emit(LoadingDeleteNoteById());
        final result = dbprovider.deleteNoteByID(event.id);
        emit(SuccessDeleteNoteById());
      } catch (e) {
        emit(FailureDeleteNoteById(info: e.toString()));
      }
    });
  }
}
