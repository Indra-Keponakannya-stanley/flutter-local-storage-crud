import 'package:flutter/material.dart';
import '../db/note_db.dart';
import '../models/note.dart';
import 'note_form_page.dart';


class NotesPage extends StatefulWidget {
@override
_NotesPageState createState() => _NotesPageState();
}


class _NotesPageState extends State<NotesPage> {
List<Note> notes = [];


void loadNotes() async {
notes = await NoteDatabase.instance.readAllNotes();
setState(() {});
}


@override
void initState() {
super.initState();
loadNotes();
}


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('My Notes')),
floatingActionButton: FloatingActionButton(
child: Icon(Icons.add),
onPressed: () async {
await Navigator.push(context, MaterialPageRoute(builder: (_) => NoteFormPage()));
loadNotes();
},
),
body: ListView.builder(
itemCount: notes.length,
itemBuilder: (context, index) {
final note = notes[index];
return ListTile(
title: Text(note.title),
subtitle: Text(note.date),
trailing: IconButton(
icon: Icon(Icons.delete),
onPressed: () async {
await NoteDatabase.instance.delete(note.id!);
loadNotes();
},
),
);
},
),
);
}
}