import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/model/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  group('DatabaseHelper', () {
    test('database should be initialized and not null', () async {
      // Arrange
      final dbHelper = DatabaseHelper.instance;
      // Act
      final database = await dbHelper.database;
      // Assert
      expect(database, isNotNull);
    });

    test('tables should be created on database creation', () async {
      // Arrange
      final dbHelper = DatabaseHelper.instance;
      // Act
      final database = await dbHelper.database;
      // Get the list of tables
      final tables = await database.query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
      // Assert
      expect(tables, isList);
      expect(tables.length, 2); // Assuming there are two tables: notes and reminders
    });
  });
}
