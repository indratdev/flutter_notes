import 'package:flutter/material.dart';
import 'package:flutter_notes/helpers/constants.dart';
import 'package:flutter_notes/helpers/note_color.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NoteColors.springRain,
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(color: NoteColors.plantation),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: NoteColors.springRain, //Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: MediaQuery.of(context).size.width / 2,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(Constants.appName),
              Text('Version : ${Constants.appVersion}'),
              SizedBox(height: 10),
              Text('Developer'),
              Text('Indrat Saputra'),
            ],
          ),
        ),
      ),
    );
  }
}
