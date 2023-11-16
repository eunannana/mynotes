// lib/controller/note_controller.dart
import 'package:mynotes/model/note_model.dart';
import 'package:mynotes/model/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class NoteController {
  Future<int> insertNote(Note note) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotes() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }
}
