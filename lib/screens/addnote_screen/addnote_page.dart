import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/bloc/bloc_notes/notes_bloc.dart';
import 'package:flutter_notes/helpers/note_color.dart';
import 'package:flutter_notes/models/notes_model.dart';
import 'package:flutter_notes/screens/widgets/reuse_widgets.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return BlocConsumer<NotesBloc, NotesState>(
      listener: (context, state) {
        if (state is SuccessAddNewNote) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: reuseIconSuccess(context),
              content: const Text('Data Berhasil disimpan',
                  textAlign: TextAlign.center),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/noteApp', (route) => false);
                    context.read<NotesBloc>().add(ViewAllNotes());
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
            barrierColor: NoteColors.springRain,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: NoteColors.oysterBay,
          floatingActionButton: FloatingActionButton(
            backgroundColor: NoteColors.coral,
            onPressed: () {
              if (keyForm.currentState!.validate()) {
                final notes = NotesModel(
                  title: titleController.text,
                  content: contentController.text,
                  createdTime: DateTime.now(),
                  modifieldTime: DateTime.parse("1900-01-01 01:00:00.000000"),
                );

                context.read<NotesBloc>().add(AddNewNote(note: notes));
              }
            },
            child: Icon(Icons.save),
          ),
          appBar: AppBar(
            backgroundColor: NoteColors.frenchPass,
            title: const Text(
              'Tambah Notes',
              style: TextStyle(color: NoteColors.blackColor),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
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
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      textAlignVertical: TextAlignVertical.top,
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
        );
      },
    );
  }
}
