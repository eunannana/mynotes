import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/controller/note_controller.dart';
import 'package:mynotes/model/note_model.dart';

void main() {
  group('NoteController', () {
    test('insertNote should insert a note into the database', () async {
      // Arrange
      final noteController = NoteController();
      final note = Note(id: 1, title: 'Test Note', content: 'Test Content');

      // Act
      final result = await noteController.insertNote(note);

      // Assert
      expect(result, 1); 
    });

    test('getNotes should return a list of notes from the database', () async {
      // Arrange
      final noteController = NoteController();

      // Act
      final notes = await noteController.getNotes();

      // Assert
      expect(notes, isList); 
    });

  });
}
