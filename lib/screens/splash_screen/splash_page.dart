import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_notes/helpers/note_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/noteApp'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: NoteColors.springRain,
        child: Image.asset(
          'assets/images/note-book.png',
        ),
      ),
    );
  }
}
