import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/bloc/bloc_theme/theme_bloc.dart';
import 'package:flutter_notes/helpers/note_color.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _groupValue = 1;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is SuccessChangeTheme) {
          _groupValue = state.groupValue;
        }
        return Scaffold(
          backgroundColor: NoteColors.oysterBay,
          appBar: AppBar(
            backgroundColor: NoteColors.frenchPass,
            title: const Text(
              'Pilihan Mode',
              style: TextStyle(
                color: NoteColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Pilih Tema : '),
              ),
              RadioListTile(
                title: Text('Terang'),
                value: 1,
                groupValue: _groupValue,
                onChanged: (int? value) {
                  context.read<ThemeBloc>().add(ChangeTheme(value: value!));
                },
              ),
              RadioListTile(
                title: Text('Gelap'),
                value: 2,
                groupValue: _groupValue,
                onChanged: (int? value) {
                  context.read<ThemeBloc>().add(ChangeTheme(value: value!));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
