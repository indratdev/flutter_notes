import 'package:flutter/material.dart';
import 'package:flutter_notes/models/notes_model.dart';
import 'package:flutter_notes/screens/about_screen/about_page.dart';
import 'package:flutter_notes/screens/addnote_screen/addnote_page.dart';
import 'package:flutter_notes/screens/editnote_screen/editnote_page.dart';
import 'package:flutter_notes/screens/notes_page.dart';
import 'package:flutter_notes/screens/setting_screen/setting_page.dart';
import 'package:flutter_notes/screens/splash_screen/splash_page.dart';
import 'package:flutter_notes/screens/theme_screen/theme_page.dart';

class Routes {
  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      '/': (_) => SplashPage(),
      '/noteApp': (_) => NoteApp(),
      '/addNote': (_) => AddNotePage(),
      '/editNote': (_) => EditNotePage(),
      '/settings': (_) => SettingPage(),
      '/setting/theme': (_) => ThemePage(),
      '/setting/about': (_) => AboutPage(),
    };
  }
}
