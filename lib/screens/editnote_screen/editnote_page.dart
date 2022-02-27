import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/bloc/bloc_notes/notes_bloc.dart';
import 'package:flutter_notes/helpers/note_color.dart';
import 'package:flutter_notes/models/notes_model.dart';
import 'package:flutter_notes/screens/widgets/reuse_widgets.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return BlocConsumer<NotesBloc, NotesState>(
      listener: (context, state) {
        if (state is SuccessUpdateNoteState) {
          reuseSuccessDialog(context, 'Data Berhasil di-update', () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/noteApp', (route) => false);
            context.read<NotesBloc>().add(ViewAllNotes());
          });
        }
        if (state is SuccessDeleteNoteById) {
          reuseSuccessDialog(context, 'Data Berhasil di-hapus', () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/noteApp', (route) => false);
            context.read<NotesBloc>().add(ViewAllNotes());
          });
        }
      },
      builder: (context, state) {
        if (state is ViewNoteState) {
          NotesModel note = state.note;
          titleController.text = state.note.title;
          contentController.text = state.note.content;
          return WillPopScope(
            onWillPop: () {
              context.read<NotesBloc>().add(ViewAllNotes());
              return Future.value(true);
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: NoteColors.springRain,
                title: Text(
                  state.note.title,
                  style: TextStyle(color: NoteColors.plantation),
                  overflow: TextOverflow.ellipsis,
                ),
                actions: [
                  PopupMenuButton<int>(
                      itemBuilder: (context) => [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.delete, color: Colors.red),
                                  SizedBox(width: 10),
                                  const Text('Hapus',
                                      style: TextStyle(color: Colors.red))
                                ],
                              ),
                            ),
                          ],
                      onSelected: (value) => SelectedItem(context, value,
                          note) //SelectedItem(context, value, ),

                      )
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul Tidak Boleh Kosong';
                          }
                          return null;
                        },
                        autofocus: true,
                        autocorrect: false,
                        decoration: InputDecoration(
                            label: const Text('Judul '),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.4,
                        child: TextFormField(
                          controller: contentController,
                          autofocus: true,
                          autocorrect: false,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            label: const Text('Content '),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: NoteColors.plantation,
                onPressed: () {
                  if (keyForm.currentState!.validate()) {
                    final notes = NotesModel(
                      title: titleController.text,
                      content: contentController.text,
                      createdTime: state.note.createdTime,
                      modifieldTime: DateTime.now(),
                    );

                    BlocProvider.of<NotesBloc>(context, listen: false)
                        .add(UpdateNoteEvent(id: state.note.id!, note: notes));
                  }
                },
                child: const Icon(Icons.save),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

void SelectedItem(BuildContext context, item, NotesModel note) {
  switch (item) {
    case 0:
      context.read<NotesBloc>().add(DeleteNoteByID(id: note.id!));
      break;
  }
}
