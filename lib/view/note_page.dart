// lib/view/note_page.dart
import 'package:flutter/material.dart';
import 'package:mynotes/controller/note_controller.dart';
import 'package:mynotes/model/note_model.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final NoteController _noteController = NoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Note note = Note(
                id: 0,
                title: _titleController.text,
                content: _contentController.text,
              );
              await _noteController.insertNote(note);
              setState(() {
                _titleController.clear();
                _contentController.clear();
              });
            },
            child: Text('Add Note'),
          ),
          Expanded(
            child: FutureBuilder<List<Note>>(
              future: _noteController.getNotes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Note> notes = snapshot.data!;
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(notes[index].title),
                        subtitle: Text(notes[index].content),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
