import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/helpers/routes.dart';

import 'bloc/bloc_notes/notes_bloc.dart';
import 'bloc/bloc_theme/theme_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  ThemeData appThema = ThemeData(fontFamily: 'Gilroy');

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesBloc()..add(ViewAllNotes())),
        // BlocProvider(create: (context) => OperationNoteBloc()),
        BlocProvider(create: (context) => ThemeBloc())
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SuccessChangeTheme) {
            appThema = state.theme;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appThema,
            darkTheme: ThemeData.dark(),
            // themeMode: ThemeMode.light,
            routes: Routes().getRoutes(),
          );
        },
      ),
    );
  }
}
