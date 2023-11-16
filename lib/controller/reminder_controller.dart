// lib/controller/reminder_controller.dart
import 'package:mynotes/model/reminder_model.dart';
import 'package:mynotes/model/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class ReminderController {
  Future<int> insertReminder(Reminder reminder) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('reminders', reminder.toMap());
  }

  Future<List<Reminder>> getReminders() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> maps = await db.query('reminders');
    return List.generate(maps.length, (i) {
      return Reminder(
        id: maps[i]['id'],
        title: maps[i]['title'],
        dateTime: maps[i]['dateTime'],
      );
    });
  }
}
