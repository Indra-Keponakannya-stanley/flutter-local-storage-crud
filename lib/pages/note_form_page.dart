import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../db/note_db.dart';
import '../models/note.dart';


class NoteFormPage extends StatelessWidget {
final titleCtrl = TextEditingController();
final contentCtrl = TextEditingController();


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Add Note')),
body: Padding(
padding: EdgeInsets.all(16),
child: Column(
children: [
TextField(controller: titleCtrl, decoration: InputDecoration(labelText: 'Title')),
TextField(controller: contentCtrl, decoration: InputDecoration(labelText: 'Content')),
SizedBox(height: 20),
ElevatedButton(
onPressed: () async {
final note = Note(
title: titleCtrl.text,
content: contentCtrl.text,
date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
);
await NoteDatabase.instance.create(note);
Navigator.pop(context);
},
child: Text('Save'),
)
],
),
),
);
}
}