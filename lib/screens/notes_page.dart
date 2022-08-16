import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/bloc/bloc_notes/notes_bloc.dart';
import 'package:flutter_notes/helpers/constants.dart';
import 'package:flutter_notes/helpers/note_color.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NoteColors.oysterBay,
      appBar: AppBar(
        backgroundColor: NoteColors.frenchPass,
        title: Text(
          Constants.appName,
          style: const TextStyle(
            color: NoteColors.blackColor,
            // fontWeight: FontWeight.w800,
            fontFamily: 'Gilroy',
          ),
        ),
        actions: [actionAppBarButton()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(CupertinoIcons.add),
        backgroundColor: NoteColors.coral,
      ),
      body: _body(),
    );
  }
}

class actionAppBarButton extends StatelessWidget {
  const actionAppBarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: IconButton(
        icon: const Icon(
          Icons.settings,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
    );
  }
}

class _body extends StatelessWidget {
  const _body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is LoadingNotesState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is FailureNotesState) {
          return Center(child: Text('Gagal Load Notes'));
        }

        if (state is LoadedNotesState) {
          final notes = state.notes;
          if (notes.length == 0) {
            return Center(
                child: Text(
              'Tidak Ada Data',
              style: TextStyle(fontSize: 20),
            ));
          } else {
            return Container(
              padding: EdgeInsets.all(5),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context
                          .read<NotesBloc>()
                          .add(ViewNoteEvent(id: notes[index].id!));
                      Navigator.pushNamed(context, '/editNote');
                    },
                    child: Card(
                      elevation: 10,
                      color: (index % 4 == 0)
                          ? NoteColors.greenLight
                          : NoteColors.cream,
                      child: ListTile(
                        title: Text(
                          notes[index].title,
                          style: const TextStyle(
                            color: NoteColors.blackColor,
                          ),
                        ),
                        subtitle: Text(
                          notes[index].content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                          style: TextStyle(
                            color: NoteColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        } else {
          return Container();
          // Center(
          //   child: Text('GAGAL MEMUAT DATA'),
          // );
        }
      },
    );
  }
}
//         
      
      
      
