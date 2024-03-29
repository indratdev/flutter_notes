import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/bloc/bloc_notes/notes_bloc.dart';
import 'package:flutter_notes/helpers/note_color.dart';
import 'package:flutter_notes/screens/widgets/reuse_widgets.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<NotesBloc>().add(ViewAllNotes());
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: NoteColors.oysterBay,
        appBar: AppBar(
          backgroundColor: NoteColors.frenchPass,
          title: Text(
            'Settings',
            style: TextStyle(
              color: NoteColors.blackColor,
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            _clearData(),
            // _theme(),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/setting/about');
                },
                child: myCard('Tentang Aplikasi', Icons.apps_outlined)),
          ],
        ),
      ),
    );
  }
}

class _theme extends StatelessWidget {
  const _theme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/setting/theme');
      },
      child: Card(
        color: NoteColors.backgroundColor,
        elevation: 5,
        shadowColor: NoteColors.springRain,
        child: ListTile(
          leading: Icon(
            Icons.brightness_6,
            color: Colors.black,
          ),
          title: Text('Thema'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

class _clearData extends StatelessWidget {
  const _clearData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesBloc, NotesState>(
      listener: (context, state) {
        if (state is SuccessDeleteAllNoteState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: reuseIconSuccess(context),
              content: const Text('Semua Data Berhasil Dihapus',
                  textAlign: TextAlign.center),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Konfirmasi"),
                content: const Text("Anda Yakin Hapus Semua Data ?"),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<NotesBloc>(context)
                          .add(DeleteAllNoteEvent());
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text(
                      "Hapus",
                      // style: TextStyle(
                      //     // color: NoteColors.backgroundColor,
                      //     backgroundColor: NoteColors.springRain)
                    ),
                  ),
                ],
              ),
            );
          },
          child: Card(
            color: NoteColors.backgroundColor,
            elevation: 5,
            shadowColor: NoteColors.springRain,
            child: ListTile(
              leading: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: Text('Hapus Semua Data'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      },
    );
  }
}
