import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/helpers/note_color.dart';

Widget myCard(String title, IconData icons) {
  return Card(
    color: NoteColors.backgroundColor,
    elevation: 10,
    shadowColor: NoteColors.springRain,
    child: ListTile(
      title: Text(title),
      leading: Icon(
        icons,
        color: Colors.black,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  );
}

Widget reuseIconSuccess(BuildContext context) {
  return Icon(
    CupertinoIcons.check_mark_circled,
    size: MediaQuery.of(context).size.width / 3,
    color: Colors.green,
  );
}

Future reuseSuccessDialog(
    BuildContext context, String title, Function()? onpress) {
  return showDialog(
    barrierColor: NoteColors.oysterBay,
    context: context,
    builder: (context) => AlertDialog(
      title: reuseIconSuccess(context),
      content: Text(title, textAlign: TextAlign.center),
      actions: [
        ElevatedButton(
          onPressed: onpress,
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
